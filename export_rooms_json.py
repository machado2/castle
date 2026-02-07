#!/usr/bin/env python3
"""Export Castle Excellent room layouts as a single JSON file."""

import json
import os

ROM_PATH = '/home/fabio/src/c2/rom.MX1'
OUT_PATH = '/home/fabio/src/c2/castle_excellent/assets/rooms.json'
BASE = 0x4000


class RoomDecoder:
    def __init__(self, data):
        self.data = data
        self.ptr_table_off = 0x7CF2 - BASE

    def read_byte(self, rom_addr):
        off = rom_addr - BASE
        if 0 <= off < len(self.data):
            return self.data[off]
        return 0

    def read_word(self, rom_addr):
        return self.read_byte(rom_addr) | (self.read_byte(rom_addr + 1) << 8)

    def get_room_pointers(self, group, room_idx):
        base_off = self.ptr_table_off + group * 42
        left_bnd = self.data[base_off + room_idx * 4] | (self.data[base_off + room_idx * 4 + 1] << 8)
        interior = self.data[base_off + room_idx * 4 + 2] | (self.data[base_off + room_idx * 4 + 3] << 8)
        right_bnd = self.data[base_off + (room_idx + 1) * 4] | (self.data[base_off + (room_idx + 1) * 4 + 1] << 8)
        return left_bnd, interior, right_bnd

    def decode_boundary_stream(self, addr, grid, start_h, target_h):
        h = start_h
        l = 0
        pos = addr - BASE

        while h < target_h:
            if pos >= len(self.data):
                break
            byte = self.data[pos]
            pos += 1

            count = (byte & 0x07) + 1
            tile_type = byte >> 3

            if count == 8:
                while pos < len(self.data):
                    ext = self.data[pos]
                    pos += 1
                    count += ext
                    if ext != 0xFF:
                        break

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
                        pass

                l += 1
                if l >= 20:
                    l = 0
                    h += 2

        return BASE + pos

    def decode_interior_geometry(self, addr, grid):
        h = 2
        l = 0
        pos = addr - BASE

        while l < 20:
            if pos >= len(self.data):
                break
            byte = self.data[pos]
            pos += 1

            count = (byte & 0x0F) + 1
            tile_type = byte >> 4

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
                        if tile_type in (10, 11) and l + 1 < 20:
                            grid[l + 1][h] = tile_type
                            if h + 1 < 30:
                                grid[l + 1][h + 1] = tile_type

                h += 2
                if h >= 28:
                    h = 2
                    l += 1

        return BASE + pos

    def decode_interior_attributes(self, addr, grid_attr):
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
        left_ptr, int_ptr, right_ptr = self.get_room_pointers(group, room_idx)

        grid = [[0] * 30 for _ in range(20)]
        attr_grid = [[0] * 30 for _ in range(20)]

        self.decode_boundary_stream(left_ptr, grid, 0, 2)
        self.decode_boundary_stream(right_ptr, grid, 28, 30)

        next_addr = self.decode_interior_geometry(int_ptr, grid)
        next_addr = self.decode_interior_attributes(next_addr, attr_grid)

        objects, _ = self.decode_objects(next_addr)

        return grid, attr_grid, objects


def main():
    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)

    data = open(ROM_PATH, 'rb').read()
    decoder = RoomDecoder(data)

    rooms = []
    for group in range(6):
        for room_idx in range(10):
            room_id = group * 10 + room_idx
            try:
                grid, _, objects = decoder.decode_room(group, room_idx)
                room_entry = {
                    "id": room_id,
                    "group": group,
                    "room_idx": room_idx,
                    "tiles": grid,
                    "objects": [{"x": x, "y": y, "code": code} for x, y, code in objects],
                }
                rooms.append(room_entry)
                print(f"Room {room_id:2d} (G{group}R{room_idx}): {sum(1 for r in grid for c in r if c > 0):3d} tiles, {len(objects):2d} objects")
            except Exception as e:
                print(f"Room {room_id:2d} (G{group}R{room_idx}): ERROR - {e}")

    output = {"rooms": rooms}
    with open(OUT_PATH, 'w') as f:
        json.dump(output, f)

    print(f"\n{len(rooms)} rooms exported to {OUT_PATH}")


if __name__ == '__main__':
    main()
