#!/usr/bin/env python3
"""
Extract graphical assets from Castle Excellent (ASCII, 1986) MSX1 ROM.

ROM: 32KB loaded at address $4000
VDP: TMS9918 Screen 2 (256x192 graphics mode)
VRAM layout (from ROM init code at 0x0CDC):
  Pattern Generator Table: 0x0000
  Pattern Name Table:      0x1800
  Color Table:             0x2000
  Sprite Attribute Table:  0x1B00
  Sprite Pattern Table:    0x3800

Graphics data in ROM uses interleaved pattern+color format:
  16 bytes per 8x8 tile (8 rows x 2 bytes: pattern_byte, color_byte)
"""

import os
import struct
from PIL import Image

ROM_PATH = "/home/fabio/src/c2/rom.MX1"
ASSETS_DIR = "/home/fabio/src/c2/assets"
ROM_BASE = 0x4000

TMS9918_PALETTE = [
    (0, 0, 0, 0),        # 0: Transparent
    (0, 0, 0, 255),       # 1: Black
    (33, 200, 66, 255),   # 2: Medium Green
    (94, 220, 120, 255),  # 3: Light Green
    (84, 85, 237, 255),   # 4: Dark Blue
    (125, 118, 252, 255), # 5: Light Blue
    (212, 82, 77, 255),   # 6: Dark Red
    (66, 235, 245, 255),  # 7: Cyan
    (252, 85, 84, 255),   # 8: Medium Red
    (255, 121, 120, 255), # 9: Light Red
    (212, 193, 84, 255),  # 10: Dark Yellow
    (230, 206, 128, 255), # 11: Light Yellow
    (33, 176, 59, 255),   # 12: Dark Green
    (201, 91, 186, 255),  # 13: Magenta
    (204, 204, 204, 255), # 14: Gray
    (255, 255, 255, 255), # 15: White
]

SCALE = 4


def load_rom():
    with open(ROM_PATH, "rb") as f:
        return f.read()


def render_tile_interleaved(data, offset, bg_override=None):
    """Render an 8x8 tile from interleaved pattern+color data (16 bytes)."""
    img = Image.new("RGBA", (8, 8))
    pixels = img.load()
    for row in range(8):
        pat = data[offset + row * 2]
        col = data[offset + row * 2 + 1]
        fg = (col >> 4) & 0xF
        bg = col & 0xF
        if bg_override is not None:
            bg = bg_override
        for bit in range(8):
            is_set = (pat >> (7 - bit)) & 1
            color_idx = fg if is_set else bg
            pixels[bit, row] = TMS9918_PALETTE[color_idx]
    return img


def render_tile_plain(data, offset, fg=15, bg=1):
    """Render an 8x8 tile from 8 bytes of pattern data (no color info)."""
    img = Image.new("RGBA", (8, 8))
    pixels = img.load()
    for row in range(8):
        pat = data[offset + row]
        for bit in range(8):
            is_set = (pat >> (7 - bit)) & 1
            color_idx = fg if is_set else bg
            pixels[bit, row] = TMS9918_PALETTE[color_idx]
    return img


def scale_image(img, scale=SCALE):
    return img.resize((img.width * scale, img.height * scale), Image.NEAREST)


def make_tile_sheet(tiles, cols, scale=SCALE):
    """Arrange a list of tile images into a sheet."""
    if not tiles:
        return Image.new("RGBA", (1, 1))
    tw, th = tiles[0].size
    rows = (len(tiles) + cols - 1) // cols
    sheet = Image.new("RGBA", (cols * tw * scale, rows * th * scale))
    for i, tile in enumerate(tiles):
        x = (i % cols) * tw * scale
        y = (i // cols) * th * scale
        sheet.paste(scale_image(tile, scale), (x, y))
    return sheet


def extract_interleaved_tiles(data, start, end, label):
    """Extract tiles stored in interleaved pattern+color format (16 bytes each)."""
    tiles = []
    for offset in range(start, min(end, len(data) - 15), 16):
        tiles.append(render_tile_interleaved(data, offset))
    return tiles


def extract_font(data):
    """Extract the game font from ROM offset 0x4800.

    Characters are stored in interleaved format, 7 pattern rows + 1 blank row = 8 rows.
    Each character spans 16 bytes (8 rows x 2 bytes interleaved).
    """
    offset = 0x4800
    patterns = []
    colors = []
    for i in range(400):
        if offset + i * 2 + 1 >= len(data):
            break
        patterns.append(data[offset + i * 2])
        colors.append(data[offset + i * 2 + 1])

    chars = []
    current_pat = []
    current_col = []
    for i in range(len(patterns)):
        if patterns[i] == 0:
            if current_pat:
                chars.append((current_pat[:], current_col[:]))
                current_pat = []
                current_col = []
        else:
            current_pat.append(patterns[i])
            current_col.append(colors[i])
    if current_pat:
        chars.append((current_pat, current_col))

    valid_chars = [(p, c) for p, c in chars if len(p) >= 5]

    font_tiles = []
    for pat_rows, col_rows in valid_chars:
        img = Image.new("RGBA", (8, 8), TMS9918_PALETTE[1])
        pixels = img.load()
        start_row = max(0, (8 - len(pat_rows)) // 2)
        for r, (p, c) in enumerate(zip(pat_rows, col_rows)):
            row = start_row + r
            if row >= 8:
                break
            fg = (c >> 4) & 0xF
            bg = c & 0xF
            for bit in range(8):
                is_set = (p >> (7 - bit)) & 1
                pixels[bit, row] = TMS9918_PALETTE[fg if is_set else bg]
        font_tiles.append(img)

    return font_tiles


def extract_number_tiles(data):
    """Extract the double-wide number tiles at ROM 0x620C.

    These are paired 8x8 tiles (left+right halves) forming 16x8 digit characters.
    Stored as plain pattern data without interleaved color.
    """
    tiles = []
    offset = 0x620C

    for i in range(20):
        if offset + 8 > len(data):
            break
        tile = render_tile_plain(data, offset, fg=15, bg=1)
        tiles.append(tile)
        offset += 8

    digits = []
    for i in range(0, len(tiles) - 1, 2):
        combined = Image.new("RGBA", (16, 8), TMS9918_PALETTE[1])
        combined.paste(tiles[i], (0, 0))
        combined.paste(tiles[i + 1], (8, 0))
        digits.append(combined)

    return tiles, digits


def find_sprite_data(data):
    """Find and extract sprite patterns.

    Character sprites are stored in interleaved format at various locations.
    The main sprite data referenced by the game is around 0x5800-0x6170.
    """
    sprites_16x16 = []

    for base in range(0x5800, 0x6160, 64):
        if base + 64 > len(data):
            break
        quadrants = []
        for q in range(4):
            quadrants.append(render_tile_interleaved(data, base + q * 16))
        combined = Image.new("RGBA", (16, 16))
        combined.paste(quadrants[0], (0, 0))
        combined.paste(quadrants[1], (8, 0))
        combined.paste(quadrants[2], (0, 8))
        combined.paste(quadrants[3], (8, 8))
        sprites_16x16.append(combined)

    return sprites_16x16


def extract_environment_tiles(data):
    """Extract environment/background tiles from various data sections."""
    sections = {
        "castle_tiles_A": (0x5000, 0x5800),
        "castle_tiles_B": (0x5800, 0x6000),
        "castle_tiles_C": (0x6000, 0x6170),
    }
    all_tiles = {}
    for name, (start, end) in sections.items():
        tiles = extract_interleaved_tiles(data, start, end, name)
        if tiles:
            all_tiles[name] = tiles
    return all_tiles


def extract_title_screen_tiles(data):
    """Extract tiles used in the title/status screen area (0x6300-0x6400)."""
    tiles = extract_interleaved_tiles(data, 0x62F6, 0x6400, "title_screen")
    return tiles


def extract_map_data(data):
    """Extract and analyze level/map data.

    Map pointer table starts around ROM 0x3BC0 with packed room data.
    Room data at 0x63D0+ appears to use run-length encoding.
    """
    maps_info = []

    ptr_base = 0x3CF2
    pointers = []
    for i in range(60):
        off = ptr_base + i * 2
        if off + 1 >= len(data):
            break
        addr = data[off] | (data[off + 1] << 8)
        if addr < 0x8000 or addr >= 0xC000:
            break
        pointers.append(addr)

    maps_info.append(f"Found {len(pointers)} room/level pointers starting at ROM 0x{ptr_base:04X}")
    if pointers:
        maps_info.append(f"  Address range: 0x{min(pointers):04X} - 0x{max(pointers):04X}")
        maps_info.append(f"  ROM offset range: 0x{min(pointers)-ROM_BASE:04X} - 0x{max(pointers)-ROM_BASE:04X}")

    map_start = 0x63D0
    map_end = min(0x7F00, len(data))
    map_data = data[map_start:map_end]
    maps_info.append(f"\nMap/level data region: ROM 0x{map_start:04X}-0x{map_end:04X} ({len(map_data)} bytes)")

    return maps_info, pointers


def extract_music_data(data):
    """Extract information about music/sound data."""
    info = []

    music_offset = 0x38D4
    music_end = music_offset
    while music_end < len(data) and data[music_end] != 0xFF:
        music_end += 1
    music_end = min(music_end + 1, len(data))

    info.append(f"Music note data at ROM 0x{music_offset:04X}-0x{music_end:04X} ({music_end - music_offset} bytes)")
    text = data[music_offset:min(music_offset + 80, music_end)]
    info.append(f"  Preview: {text}")

    freq_table_offset = 0x3810
    info.append(f"\nFrequency table at ROM 0x{freq_table_offset:04X} (96 entries, 2 bytes each)")

    wrtpsg_count = 0
    for i in range(len(data) - 3):
        if data[i] == 0xCD and data[i + 1] == 0x93 and data[i + 2] == 0x00:
            wrtpsg_count += 1
    info.append(f"WRTPSG calls in ROM: {wrtpsg_count}")

    return info


def extract_text_strings(data):
    """Extract readable text strings from the ROM."""
    strings = []

    regions = [
        (0x1680, 0x16D8),
        (0x2467, 0x2498),
        (0x19D0, 0x19E8),
    ]

    for start, end in regions:
        s = ""
        for b in data[start:end]:
            if b == 0x40:
                if s.strip():
                    strings.append((start, s))
                s = ""
                start = start + len(s) + 1
            elif 0x20 <= b < 0x7F:
                s += chr(b)
            else:
                if s.strip():
                    strings.append((start, s))
                s = ""
        if s.strip():
            strings.append((start, s))

    copyright_off = 0x7FF0
    if copyright_off + 16 <= len(data):
        s = ""
        for b in data[copyright_off:copyright_off + 16]:
            if 0x20 <= b < 0x7F:
                s += chr(b)
        if s:
            strings.append((copyright_off, s))

    return strings


def save_palette_reference():
    """Save a visual palette reference image."""
    img = Image.new("RGBA", (16 * 32, 48))
    pixels = img.load()
    for i in range(16):
        for y in range(48):
            for x in range(32):
                pixels[i * 32 + x, y] = TMS9918_PALETTE[i]
    img.save(os.path.join(ASSETS_DIR, "palette_reference.png"))


def main():
    os.makedirs(ASSETS_DIR, exist_ok=True)
    data = load_rom()
    print(f"ROM loaded: {len(data)} bytes")
    print(f"ROM header: {'AB' if data[0:2] == b'AB' else 'Unknown'}")
    print(f"Init address: 0x{data[2] | (data[3] << 8):04X}")
    print()

    summary = []

    # 1. Font
    print("=== Extracting Font ===")
    font_tiles = extract_font(data)
    if font_tiles:
        sheet = make_tile_sheet(font_tiles, 10)
        sheet.save(os.path.join(ASSETS_DIR, "font.png"))
        summary.append(f"Font: {len(font_tiles)} characters extracted from ROM 0x4800")
        print(f"  {len(font_tiles)} characters -> font.png")

    # 2. Number tiles
    print("=== Extracting Number Tiles ===")
    num_tiles, num_digits = extract_number_tiles(data)
    if num_tiles:
        sheet = make_tile_sheet(num_tiles, 10)
        sheet.save(os.path.join(ASSETS_DIR, "number_tiles.png"))
        summary.append(f"Number tiles: {len(num_tiles)} 8x8 tiles from ROM 0x620C")
        print(f"  {len(num_tiles)} tiles -> number_tiles.png")
    if num_digits:
        sheet = make_tile_sheet(num_digits, 5, scale=SCALE)
        sheet.save(os.path.join(ASSETS_DIR, "number_digits.png"))
        summary.append(f"Number digits: {len(num_digits)} combined 16x8 digit characters")
        print(f"  {len(num_digits)} digits -> number_digits.png")

    # 3. Environment/castle tiles
    print("=== Extracting Environment Tiles ===")
    env_tiles = extract_environment_tiles(data)
    total_env = 0
    for name, tiles in env_tiles.items():
        sheet = make_tile_sheet(tiles, 16)
        sheet.save(os.path.join(ASSETS_DIR, f"{name}.png"))
        total_env += len(tiles)
        summary.append(f"  {name}: {len(tiles)} tiles")
        print(f"  {name}: {len(tiles)} tiles -> {name}.png")
    summary.insert(len(summary) - len(env_tiles), f"Environment tiles: {total_env} total")

    # 4. Character sprites (16x16)
    print("=== Extracting Sprites ===")
    sprites = find_sprite_data(data)
    if sprites:
        sheet = make_tile_sheet(sprites, 8, scale=SCALE)
        sheet.save(os.path.join(ASSETS_DIR, "sprites_16x16.png"))
        summary.append(f"Sprites (16x16): {len(sprites)} from ROM 0x5800-0x6160")
        print(f"  {len(sprites)} sprites -> sprites_16x16.png")

    # 5. All interleaved tiles as one big sheet (for completeness)
    print("=== Extracting Full Tile Sheet ===")
    all_tiles = extract_interleaved_tiles(data, 0x4800, 0x6400, "all")
    if all_tiles:
        sheet = make_tile_sheet(all_tiles, 16)
        sheet.save(os.path.join(ASSETS_DIR, "all_tiles.png"))
        summary.append(f"Full tile sheet: {len(all_tiles)} tiles from ROM 0x4800-0x6400")
        print(f"  {len(all_tiles)} tiles -> all_tiles.png")

    # 6. Title screen / UI tiles
    print("=== Extracting Title/UI Tiles ===")
    title_tiles = extract_title_screen_tiles(data)
    if title_tiles:
        sheet = make_tile_sheet(title_tiles, 16)
        sheet.save(os.path.join(ASSETS_DIR, "title_ui_tiles.png"))
        summary.append(f"Title/UI tiles: {len(title_tiles)} from ROM 0x62F6-0x6400")
        print(f"  {len(title_tiles)} tiles -> title_ui_tiles.png")

    # 7. Additional pattern-only tiles (0x6170-0x62F6 region)
    print("=== Extracting Grid/Border Patterns ===")
    grid_tiles = []
    for off in range(0x6170, 0x620C, 8):
        grid_tiles.append(render_tile_plain(data, off, fg=15, bg=1))
    if grid_tiles:
        sheet = make_tile_sheet(grid_tiles, 16)
        sheet.save(os.path.join(ASSETS_DIR, "grid_patterns.png"))
        summary.append(f"Grid/border patterns: {len(grid_tiles)} from ROM 0x6170-0x620C")
        print(f"  {len(grid_tiles)} tiles -> grid_patterns.png")

    # 8. Large castle/background tiles (0x62F6 area has bigger decorations)
    print("=== Extracting Large Decoration Tiles ===")
    deco_tiles = extract_interleaved_tiles(data, 0x62F6, 0x6400, "decorations")
    large_deco = []
    for i in range(0, len(deco_tiles) - 3, 4):
        combined = Image.new("RGBA", (16, 16))
        combined.paste(deco_tiles[i], (0, 0))
        combined.paste(deco_tiles[i + 1], (8, 0))
        combined.paste(deco_tiles[i + 2], (0, 8))
        combined.paste(deco_tiles[i + 3], (8, 8))
        large_deco.append(combined)
    if large_deco:
        sheet = make_tile_sheet(large_deco, 4, scale=SCALE)
        sheet.save(os.path.join(ASSETS_DIR, "decorations_16x16.png"))
        summary.append(f"Decoration tiles (16x16): {len(large_deco)} from ROM 0x62F6-0x6400")
        print(f"  {len(large_deco)} tiles -> decorations_16x16.png")

    # 9. Map/level data analysis
    print("\n=== Analyzing Map/Level Data ===")
    map_info, pointers = extract_map_data(data)
    for line in map_info:
        print(f"  {line}")
    summary.extend(map_info)

    # 10. Music data analysis
    print("\n=== Analyzing Music/Sound Data ===")
    music_info = extract_music_data(data)
    for line in music_info:
        print(f"  {line}")
    summary.extend(music_info)

    # 11. Text strings
    print("\n=== Extracting Text Strings ===")
    strings = extract_text_strings(data)
    for off, s in strings:
        print(f"  ROM 0x{off:04X}: \"{s}\"")
    summary.append(f"Text strings: {len(strings)} found")

    # 12. Palette reference
    save_palette_reference()
    summary.append("Palette reference saved")

    # Write summary
    print("\n" + "=" * 60)
    print("EXTRACTION SUMMARY")
    print("=" * 60)
    for line in summary:
        print(f"  {line}")

    assets = [f for f in os.listdir(ASSETS_DIR) if f.endswith(".png")]
    print(f"\nTotal assets saved: {len(assets)} PNG files in {ASSETS_DIR}/")
    for f in sorted(assets):
        size = os.path.getsize(os.path.join(ASSETS_DIR, f))
        print(f"  {f} ({size} bytes)")


if __name__ == "__main__":
    main()
