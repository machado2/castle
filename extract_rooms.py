#!/usr/bin/env python3
"""Extract and render Castle Excellent rooms as PNG images.

Castle Excellent (ASCII, 1986) for MSX1.
Room data is RLE-encoded, organized in 6 groups of 10 rooms each (60 total).
Each room is composed from 3 streams: left boundary, right boundary, and interior.
The interior stream has 3 sub-parts: geometry tiles, attribute/color, and object placements.
"""

import os
import struct
from PIL import Image, ImageDraw, ImageFont

ROM_PATH = '/home/fabio/src/c2/rom.MX1'
OUT_DIR = '/home/fabio/src/c2/assets/rooms'
BASE = 0x4000

# TMS9918 color palette
TMS_PALETTE = [
    (0, 0, 0),        # 0: Transparent (render as black)
    (0, 0, 0),        # 1: Black
    (33, 200, 66),     # 2: Medium Green
    (94, 220, 120),    # 3: Light Green
    (84, 85, 237),     # 4: Dark Blue
    (125, 118, 252),   # 5: Light Blue
    (212, 82, 77),     # 6: Dark Red
    (66, 235, 245),    # 7: Cyan
    (252, 85, 84),     # 8: Medium Red
    (255, 121, 120),   # 9: Light Red
    (212, 193, 84),    # 10: Dark Yellow
    (230, 206, 128),   # 11: Light Yellow
    (33, 176, 59),     # 12: Dark Green
    (201, 91, 186),    # 13: Magenta
    (204, 204, 204),   # 14: Gray
    (255, 255, 255),   # 15: White
]

# Tile type color mapping for schematic rendering
# Each tile type gets a distinct color for visualization
TILE_COLORS = {
    0:  (0, 0, 0),        # Empty - black
    1:  (180, 80, 60),    # Wall type 1 - brick red
    2:  (140, 60, 40),    # Wall type 2 - dark brick
    3:  (200, 100, 80),   # Wall type 3 - light brick
    4:  (100, 100, 200),  # Floor/platform 1 - blue
    5:  (80, 80, 180),    # Floor/platform 2 - darker blue
    6:  (120, 120, 220),  # Floor/platform 3 - light blue
    7:  (50, 200, 50),    # Special 1 - green
    8:  (50, 180, 50),    # Special 2 - dark green
    9:  (200, 200, 50),   # Object type 1 - yellow
    10: (180, 50, 180),   # Large block 1 - purple
    11: (160, 50, 160),   # Large block 2 - dark purple
    12: (200, 150, 50),   # Special 3 - orange
    13: (150, 200, 200),  # Special 4 - cyan
    14: (200, 200, 200),  # Special 5 - gray
    15: (250, 250, 250),  # Special 6 - white
}

# Object placement colors
OBJECT_COLORS = {
    'default': (255, 255, 0),   # Yellow for generic objects
    'door':    (0, 200, 255),   # Cyan for doors
    'key':     (255, 200, 0),   # Gold for keys
    'item':    (255, 100, 255), # Pink for items
}


class RoomDecoder:
    def __init__(self, data):
        self.data = data
        self.ptr_table_off = 0x7CF2 - BASE  # ROM offset of pointer table
    
    def read_byte(self, rom_addr):
        off = rom_addr - BASE
        if 0 <= off < len(self.data):
            return self.data[off]
        return 0
    
    def read_word(self, rom_addr):
        return self.read_byte(rom_addr) | (self.read_byte(rom_addr + 1) << 8)
    
    def get_room_pointers(self, group, room_idx):
        """Get (left_boundary, interior, right_boundary) pointers for a room."""
        base_off = self.ptr_table_off + group * 42
        # Table layout: BND[0], INT[0], BND[1], INT[1], ..., BND[10]
        # For room i: left_bnd=entry[i*2], interior=entry[i*2+1], right_bnd=entry[i*2+2]
        left_bnd = self.data[base_off + room_idx * 4] | (self.data[base_off + room_idx * 4 + 1] << 8)
        interior = self.data[base_off + room_idx * 4 + 2] | (self.data[base_off + room_idx * 4 + 3] << 8)
        right_bnd = self.data[base_off + (room_idx + 1) * 4] | (self.data[base_off + (room_idx + 1) * 4 + 1] << 8)
        return left_bnd, interior, right_bnd

    def decode_boundary_stream(self, addr, grid, start_h, target_h):
        """Decode a boundary column RLE stream.
        
        Boundary tokens: byte = tttttccc
        - ccc+1 = run length (1-8, extended if 8)
        - ttttt>>3 = type (0-31)
        
        Boundary types 0 and 16-31 are geometry (type &= 0x0F).
        Types 1-15 are attribute/color (we store them separately).
        
        Cursor advances column-major: L++ (row), wrap at L=20 -> H+=2.
        Returns updated addr (pointer past consumed data).
        """
        h = start_h
        l = 0
        pos = addr - BASE
        
        while h < target_h:
            if pos >= len(self.data):
                break
            byte = self.data[pos]
            pos += 1
            
            # Boundary format: tttttccc
            count = (byte & 0x07) + 1
            tile_type = byte >> 3
            
            # Extended count
            if count == 8:
                while pos < len(self.data):
                    ext = self.data[pos]
                    pos += 1
                    count += ext
                    if ext != 0xFF:
                        break
            
            # Determine if geometry or attribute
            is_geometry = (tile_type == 0) or (tile_type >= 16)
            geo_type = tile_type & 0x0F if is_geometry else 0
            
            for _ in range(count):
                if h >= target_h:
                    break
                if l < 20 and h < 30:
                    if is_geometry and geo_type > 0:
                        grid[l][h] = geo_type
                        if h + 1 < 30:
                            grid[l][h + 1] = geo_type
                    elif is_geometry and geo_type == 0:
                        pass  # empty
                    # Attributes (types 1-15) - we track color but don't override geometry
                
                l += 1
                if l >= 20:
                    l = 0
                    h += 2
        
        return BASE + pos

    def decode_interior_geometry(self, addr, grid):
        """Decode interior geometry RLE stream.
        
        Interior tokens: byte = ttttcccc
        - cccc+1 = run length (1-16, extended if 16)
        - tttt = tile type (0-15)
        
        Cursor advances row-major: H+=2 (column), wrap at H=28 -> H=2, L++.
        Stops when L reaches 20.
        Returns updated addr.
        """
        h = 2  # Start at interior column 2
        l = 0
        pos = addr - BASE
        
        while l < 20:
            if pos >= len(self.data):
                break
            byte = self.data[pos]
            pos += 1
            
            count = (byte & 0x0F) + 1
            tile_type = byte >> 4
            
            # Extended count
            if count == 16:
                while pos < len(self.data):
                    ext = self.data[pos]
                    pos += 1
                    count += ext
                    if ext != 0xFF:
                        break
            
            for _ in range(count):
                if l >= 20:
                    break
                if h < 28 and l < 20:
                    if tile_type > 0:
                        grid[l][h] = tile_type
                        if h + 1 < 30:
                            grid[l][h + 1] = tile_type
                        # Types 10-11 are 2x2 blocks
                        if tile_type in (10, 11) and l + 1 < 20:
                            grid[l + 1][h] = tile_type
                            if h + 1 < 30:
                                grid[l + 1][h + 1] = tile_type
                
                # Advance cursor: row-major within interior
                h += 2
                if h >= 28:
                    h = 2
                    l += 1
        
        return BASE + pos

    def decode_interior_attributes(self, addr, grid_attr):
        """Decode interior attribute/color stream.
        
        Same token format as geometry (ttttcccc).
        Cursor advances column-major: L++ (row), wrap at L=20 -> H+=2.
        Stops when H reaches 28.
        Returns updated addr.
        """
        h = 2
        l = 0
        pos = addr - BASE
        
        while h < 28:
            if pos >= len(self.data):
                break
            byte = self.data[pos]
            pos += 1
            
            count = (byte & 0x0F) + 1
            attr_type = byte >> 4
            
            if count == 16:
                while pos < len(self.data):
                    ext = self.data[pos]
                    pos += 1
                    count += ext
                    if ext != 0xFF:
                        break
            
            for _ in range(count):
                if h >= 28:
                    break
                if l < 20 and h < 30:
                    grid_attr[l][h] = attr_type
                    if h + 1 < 30:
                        grid_attr[l][h + 1] = attr_type
                
                l += 1
                if l >= 20:
                    l = 0
                    h += 2
        
        return BASE + pos

    def decode_objects(self, addr):
        """Decode object placement list.
        
        2-byte records until first byte is 0x00.
        Byte0: low nibble = X index (x = val*2), high nibble = code_low
        Byte1: low 5 bits = Y, high 3 bits = code_high
        Returns list of (x, y, code) tuples and updated addr.
        """
        objects = []
        pos = addr - BASE
        
        while pos < len(self.data):
            b0 = self.data[pos]
            if b0 == 0x00:
                pos += 1
                break
            pos += 1
            if pos >= len(self.data):
                break
            b1 = self.data[pos]
            pos += 1
            
            x = (b0 & 0x0F) * 2
            y = b1 & 0x1F
            code_low = b0 >> 4
            code_high = b1 & 0xE0
            code = code_high | code_low
            
            objects.append((x, y, code))
        
        return objects, BASE + pos

    def decode_room(self, group, room_idx):
        """Decode a complete room. Returns (grid, attr_grid, objects)."""
        left_ptr, int_ptr, right_ptr = self.get_room_pointers(group, room_idx)
        
        # Grid: 30 columns (H=0..29) × 20 rows (L=0..19)
        # But logically it's 15 cells of 2 tiles wide
        grid = [[0] * 30 for _ in range(20)]
        attr_grid = [[0] * 30 for _ in range(20)]
        
        # Phase 1: Left boundary (H=0, target H=2)
        self.decode_boundary_stream(left_ptr, grid, 0, 2)
        
        # Phase 2: Right boundary (H=28, target H=30)
        self.decode_boundary_stream(right_ptr, grid, 28, 30)
        
        # Phase 3: Interior
        # 3a: Geometry (row-major)
        next_addr = self.decode_interior_geometry(int_ptr, grid)
        
        # 3b: Attributes (column-major)
        next_addr = self.decode_interior_attributes(next_addr, attr_grid)
        
        # 3c: Object placements
        objects, _ = self.decode_objects(next_addr)
        
        return grid, attr_grid, objects


def render_room(grid, attr_grid, objects, group, room_idx, scale=8):
    """Render a room grid as a PNG image."""
    cols = 30
    rows = 20
    w = cols * scale
    h = rows * scale
    
    img = Image.new('RGB', (w, h), (0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Draw tile grid
    for row in range(rows):
        for col in range(cols):
            tile = grid[row][col]
            attr = attr_grid[row][col]
            
            x0 = col * scale
            y0 = row * scale
            
            if tile > 0:
                color = TILE_COLORS.get(tile, (128, 128, 128))
                # Modulate color slightly by attribute for visual variety
                if attr > 0:
                    r, g, b = color
                    # Shift hue based on attribute
                    r = min(255, r + attr * 8)
                    g = min(255, g + (attr % 3) * 10)
                    b = min(255, b + (attr % 5) * 6)
                    color = (r, g, b)
                
                draw.rectangle([x0, y0, x0 + scale - 1, y0 + scale - 1], fill=color)
                
                # Add subtle grid lines for non-empty tiles
                if scale >= 4:
                    draw.rectangle([x0, y0, x0 + scale - 1, y0 + scale - 1], outline=(max(0, color[0]-40), max(0, color[1]-40), max(0, color[2]-40)))
    
    # Draw objects as markers
    for ox, oy, code in objects:
        if oy < rows and ox < cols:
            cx = ox * scale + scale
            cy = oy * scale + scale // 2
            r = max(2, scale // 3)
            
            # Color by object code
            if code & 0x40:
                obj_color = (0, 200, 255)  # Doors/special
            else:
                obj_color = (255, 255, 0)  # Items/keys
            
            draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=obj_color, outline=(255, 255, 255))
    
    return img


def render_room_detailed(grid, attr_grid, objects, group, room_idx, scale=12):
    """Render a more detailed room with labels."""
    cols = 30
    rows = 20
    margin = 30
    w = cols * scale + margin * 2
    h = rows * scale + margin + 20
    
    img = Image.new('RGB', (w, h), (24, 24, 32))
    draw = ImageDraw.Draw(img)
    
    # Title
    title = f"Room {group * 10 + room_idx} (G{group}R{room_idx})"
    draw.text((margin, 2), title, fill=(255, 255, 255))
    
    ox_base = margin
    oy_base = 18
    
    # Draw tile grid
    for row in range(rows):
        for col in range(cols):
            tile = grid[row][col]
            attr = attr_grid[row][col]
            
            x0 = ox_base + col * scale
            y0 = oy_base + row * scale
            
            if tile > 0:
                color = TILE_COLORS.get(tile, (128, 128, 128))
                if attr > 0:
                    r, g, b = color
                    r = min(255, r + attr * 8)
                    g = min(255, g + (attr % 3) * 10)
                    b = min(255, b + (attr % 5) * 6)
                    color = (r, g, b)
                
                draw.rectangle([x0, y0, x0 + scale - 1, y0 + scale - 1], fill=color)
                draw.rectangle([x0, y0, x0 + scale - 1, y0 + scale - 1], 
                             outline=(max(0, color[0]-30), max(0, color[1]-30), max(0, color[2]-30)))
            else:
                # Empty cell - very dark
                draw.rectangle([x0, y0, x0 + scale - 1, y0 + scale - 1], 
                             fill=(16, 16, 20), outline=(32, 32, 40))
    
    # Draw objects
    for objx, objy, code in objects:
        if objy < rows and objx < cols:
            cx = ox_base + objx * scale + scale
            cy = oy_base + objy * scale + scale // 2
            r = max(3, scale // 3)
            
            if code & 0x40:
                obj_color = (0, 200, 255)
            else:
                obj_color = (255, 220, 0)
            
            draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=obj_color, outline=(255, 255, 255))
    
    # Column markers
    for col in range(0, cols, 2):
        x = ox_base + col * scale + scale
        draw.text((x - 3, oy_base + rows * scale + 2), str(col // 2), fill=(100, 100, 100))
    
    # Row markers  
    for row in range(0, rows, 5):
        y = oy_base + row * scale + scale // 2 - 4
        draw.text((ox_base - 15, y), str(row), fill=(100, 100, 100))
    
    return img


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    
    data = open(ROM_PATH, 'rb').read()
    decoder = RoomDecoder(data)
    
    num_groups = 6
    rooms_per_group = 10
    
    all_rooms = []
    
    for group in range(num_groups):
        for room_idx in range(rooms_per_group):
            room_num = group * rooms_per_group + room_idx
            try:
                grid, attr_grid, objects = decoder.decode_room(group, room_idx)
                
                # Count non-empty cells
                filled = sum(1 for row in grid for cell in row if cell > 0)
                obj_count = len(objects)
                
                print(f"Room {room_num:2d} (G{group}R{room_idx}): {filled:3d} tiles, {obj_count:2d} objects")
                
                # Render detailed version
                img = render_room_detailed(grid, attr_grid, objects, group, room_idx, scale=12)
                img.save(os.path.join(OUT_DIR, f'room_{room_num:02d}.png'))
                
                all_rooms.append((room_num, grid, attr_grid, objects))
                
            except Exception as e:
                print(f"Room {room_num:2d} (G{group}R{room_idx}): ERROR - {e}")
    
    # Create overview sheet: 10 columns × 6 rows
    if all_rooms:
        cell_w = 30 * 8  # 240px per room
        cell_h = 20 * 8 + 16  # 176px per room
        sheet_w = 10 * cell_w + 11 * 4  # 10 columns with 4px spacing
        sheet_h = 6 * cell_h + 7 * 4
        
        sheet = Image.new('RGB', (sheet_w, sheet_h), (16, 16, 24))
        sheet_draw = ImageDraw.Draw(sheet)
        
        for room_num, grid, attr_grid, objects in all_rooms:
            group = room_num // 10
            room_idx = room_num % 10
            
            sx = room_idx * (cell_w + 4) + 4
            sy = group * (cell_h + 4) + 4
            
            # Room label
            sheet_draw.text((sx + 2, sy + 1), f"R{room_num}", fill=(180, 180, 180))
            
            # Render small version
            small_img = render_room(grid, attr_grid, objects, group, room_idx, scale=8)
            sheet.paste(small_img, (sx, sy + 14))
        
        sheet.save(os.path.join(OUT_DIR, 'all_rooms_overview.png'))
        print(f"\nOverview sheet saved to {OUT_DIR}/all_rooms_overview.png")
    
    print(f"\n{len(all_rooms)} rooms extracted to {OUT_DIR}/")


if __name__ == '__main__':
    main()
