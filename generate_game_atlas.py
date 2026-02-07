#!/usr/bin/env python3
"""Generate tile atlas and sprite sheets for the Castle Excellent Bevy game.

Reads the MSX1 ROM and produces PNG assets in castle_excellent/assets/:
  - tile_atlas.png      (16x6 grid of 8x8 tiles from ROM tileset)
  - room_tiles.png      (16x1 strip of 8x8 room-type tiles)
  - player_sprites.png  (128x16 player sprite sheet)
  - enemy_sprites.png   (96x16 enemy sprite sheet)
  - item_sprites.png    (64x8 item sprite sheet)
"""

import os
from PIL import Image

ROM_PATH = "/home/fabio/src/c2/rom.MX1"
ASSETS_DIR = "/home/fabio/src/c2/castle_excellent/assets"
ROM_BASE = 0x4000

TMS = [
    (0, 0, 0, 0),          # 0: Transparent
    (0, 0, 0, 255),         # 1: Black
    (33, 200, 66, 255),     # 2: Medium Green
    (94, 220, 120, 255),    # 3: Light Green
    (84, 85, 237, 255),     # 4: Dark Blue
    (125, 118, 252, 255),   # 5: Light Blue
    (212, 82, 77, 255),     # 6: Dark Red
    (66, 235, 245, 255),    # 7: Cyan
    (252, 85, 84, 255),     # 8: Medium Red
    (255, 121, 120, 255),   # 9: Light Red
    (212, 193, 84, 255),    # 10: Dark Yellow
    (230, 206, 128, 255),   # 11: Light Yellow
    (33, 176, 59, 255),     # 12: Dark Green
    (201, 91, 186, 255),    # 13: Magenta
    (204, 204, 204, 255),   # 14: Gray
    (255, 255, 255, 255),   # 15: White
]

TILE_DATA_OFFSET = 0x4956
TILE_ATLAS_COUNT = 96
TILE_ATLAS_COLS = 16
TILE_ATLAS_ROWS = 6


def load_rom():
    with open(ROM_PATH, "rb") as f:
        return f.read()


def render_tile_interleaved(data, offset):
    img = Image.new("RGBA", (8, 8))
    px = img.load()
    for row in range(8):
        pat = data[offset + row * 2]
        col = data[offset + row * 2 + 1]
        fg = (col >> 4) & 0xF
        bg = col & 0xF
        for bit in range(8):
            is_set = (pat >> (7 - bit)) & 1
            px[bit, row] = TMS[fg if is_set else bg]
    return img


def make_tile(pattern_rows, color_pairs):
    img = Image.new("RGBA", (8, 8))
    px = img.load()
    for row in range(8):
        pat = pattern_rows[row]
        fg_idx, bg_idx = color_pairs[row]
        for bit in range(8):
            is_set = (pat >> (7 - bit)) & 1
            px[bit, row] = TMS[fg_idx if is_set else bg_idx]
    return img


def generate_tile_atlas(data):
    w = TILE_ATLAS_COLS * 8
    h = TILE_ATLAS_ROWS * 8
    atlas = Image.new("RGBA", (w, h))
    for i in range(TILE_ATLAS_COUNT):
        offset = TILE_DATA_OFFSET + i * 16
        tile = render_tile_interleaved(data, offset)
        x = (i % TILE_ATLAS_COLS) * 8
        y = (i // TILE_ATLAS_COLS) * 8
        atlas.paste(tile, (x, y))
    return atlas


def generate_room_tiles():
    strip = Image.new("RGBA", (16 * 8, 8))

    def place(idx, img):
        strip.paste(img, (idx * 8, 0))

    # Type 0: transparent/empty
    place(0, Image.new("RGBA", (8, 8), (0, 0, 0, 0)))

    # Type 1: brick wall (red/brown with mortar lines)
    place(1, make_tile(
        [0xFF, 0xFF, 0x88, 0x00, 0xFF, 0xFF, 0x22, 0x00],
        [(6, 1)] * 8
    ))

    # Type 2: darker brick
    place(2, make_tile(
        [0xFF, 0xFF, 0x88, 0x00, 0xFF, 0xFF, 0x22, 0x00],
        [(6, 1), (6, 1), (1, 1), (1, 1), (6, 1), (6, 1), (1, 1), (1, 1)]
    ))

    # Type 3: lighter brick
    place(3, make_tile(
        [0xFF, 0xFF, 0x88, 0x00, 0xFF, 0xFF, 0x22, 0x00],
        [(8, 1)] * 8
    ))

    # Type 4: blue platform with white top edge
    place(4, make_tile(
        [0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],
        [(15, 4), (15, 4), (4, 1), (4, 1), (4, 1), (4, 1), (4, 1), (4, 1)]
    ))

    # Type 5: darker blue platform
    place(5, make_tile(
        [0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],
        [(14, 4), (4, 1), (4, 1), (4, 1), (4, 1), (4, 1), (4, 1), (4, 1)]
    ))

    # Type 6: lighter blue platform
    place(6, make_tile(
        [0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],
        [(15, 5), (15, 5), (5, 4), (5, 4), (5, 4), (5, 4), (5, 4), (5, 4)]
    ))

    # Type 7: green ladder (vertical bars with rungs)
    place(7, make_tile(
        [0x66, 0x66, 0xFF, 0x66, 0x66, 0xFF, 0x66, 0x66],
        [(2, 0)] * 8
    ))

    # Type 8: red hazard (spikes)
    place(8, make_tile(
        [0x00, 0x24, 0x24, 0x66, 0x66, 0xE7, 0xFF, 0xFF],
        [(8, 1)] * 8
    ))

    # Type 9: yellow item indicator
    place(9, make_tile(
        [0x3C, 0x7E, 0xFF, 0xFF, 0xFF, 0xFF, 0x7E, 0x3C],
        [(10, 0)] * 8
    ))

    # Type 10: purple large block
    place(10, make_tile(
        [0xFF, 0x81, 0xBD, 0xA5, 0xA5, 0xBD, 0x81, 0xFF],
        [(13, 1)] * 8
    ))

    # Type 11: dark purple large block
    place(11, make_tile(
        [0xFF, 0x81, 0xBD, 0xA5, 0xA5, 0xBD, 0x81, 0xFF],
        [(13, 4)] * 8
    ))

    # Type 12: orange special tile
    place(12, make_tile(
        [0xFF, 0xC3, 0xA5, 0x99, 0x99, 0xA5, 0xC3, 0xFF],
        [(10, 6)] * 8
    ))

    # Type 13: cyan special tile
    place(13, make_tile(
        [0xFF, 0xBD, 0xDB, 0xE7, 0xE7, 0xDB, 0xBD, 0xFF],
        [(7, 1)] * 8
    ))

    # Type 14: gray tile
    place(14, make_tile(
        [0xFF, 0xAA, 0xFF, 0x55, 0xFF, 0xAA, 0xFF, 0x55],
        [(14, 1)] * 8
    ))

    # Type 15: white tile
    place(15, make_tile(
        [0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],
        [(15, 14)] * 8
    ))

    return strip


def make_sprite_16x16(data, offset):
    quadrants = []
    for q in range(4):
        quadrants.append(render_tile_interleaved(data, offset + q * 16))
    combined = Image.new("RGBA", (16, 16))
    combined.paste(quadrants[0], (0, 0))
    combined.paste(quadrants[1], (8, 0))
    combined.paste(quadrants[2], (0, 8))
    combined.paste(quadrants[3], (8, 8))
    return combined


def mirror_h(img):
    return img.transpose(Image.FLIP_LEFT_RIGHT)


def make_pixel_sprite_16x16(pixels_list, colors):
    img = Image.new("RGBA", (16, 16), TMS[0])
    px = img.load()
    for y, row in enumerate(pixels_list):
        for x, c in enumerate(row):
            if c < len(colors):
                px[x, y] = TMS[colors[c]]
    return img


def generate_player_sprites(data):
    sheet = Image.new("RGBA", (128, 16), (0, 0, 0, 0))

    sprite_base = 0x5200
    sprites = []
    for i in range(8):
        offset = sprite_base + i * 64
        if offset + 64 <= len(data):
            sprites.append(make_sprite_16x16(data, offset))

    if len(sprites) >= 4:
        sheet.paste(sprites[0], (0, 0))
        sheet.paste(sprites[1], (16, 0))
        sheet.paste(sprites[2], (32, 0))
        if len(sprites) > 4:
            sheet.paste(sprites[4], (48, 0))
            sheet.paste(sprites[5] if len(sprites) > 5 else sprites[4], (64, 0))
        else:
            sheet.paste(sprites[3], (48, 0))
            sheet.paste(sprites[3], (64, 0))
        if len(sprites) > 3:
            sheet.paste(sprites[3], (80, 0))
        else:
            sheet.paste(sprites[2], (80, 0))
        sheet.paste(mirror_h(sprites[0]), (96, 0))
        sheet.paste(mirror_h(sprites[1]), (112, 0))
    else:
        _ = _make_placeholder_player()
        for i in range(8):
            sheet.paste(_, (i * 16, 0))

    return sheet


def _make_placeholder_player():
    B = 1; C = 7; S = 4; W = 15; T = 0
    rows = [
        [T,T,T,T,T,C,C,C,C,C,T,T,T,T,T,T],
        [T,T,T,T,C,C,C,C,C,C,C,T,T,T,T,T],
        [T,T,T,T,C,W,B,C,B,W,C,T,T,T,T,T],
        [T,T,T,T,C,C,C,B,C,C,C,T,T,T,T,T],
        [T,T,T,T,T,C,C,C,C,C,T,T,T,T,T,T],
        [T,T,T,T,T,T,S,S,S,T,T,T,T,T,T,T],
        [T,T,T,S,S,S,S,S,S,S,S,S,T,T,T,T],
        [T,T,T,T,S,S,S,S,S,S,S,T,T,T,T,T],
        [T,T,T,T,T,S,S,S,S,S,T,T,T,T,T,T],
        [T,T,T,T,T,S,S,S,S,S,T,T,T,T,T,T],
        [T,T,T,T,T,S,T,T,T,S,T,T,T,T,T,T],
        [T,T,T,T,T,S,T,T,T,S,T,T,T,T,T,T],
        [T,T,T,T,S,S,T,T,T,S,S,T,T,T,T,T],
        [T,T,T,T,S,S,T,T,T,S,S,T,T,T,T,T],
        [T,T,T,B,B,B,T,T,T,B,B,B,T,T,T,T],
        [T,T,T,B,B,B,T,T,T,B,B,B,T,T,T,T],
    ]
    img = Image.new("RGBA", (16, 16), TMS[0])
    px = img.load()
    for y, row in enumerate(rows):
        for x, c in enumerate(row):
            px[x, y] = TMS[c]
    return img


def generate_enemy_sprites(data):
    sheet = Image.new("RGBA", (96, 16), (0, 0, 0, 0))

    enemy_base = 0x5390
    enemies = []
    for i in range(6):
        offset = enemy_base + i * 64
        if offset + 64 <= len(data):
            enemies.append(make_sprite_16x16(data, offset))

    if enemies:
        for i, spr in enumerate(enemies[:6]):
            sheet.paste(spr, (i * 16, 0))
        for i in range(len(enemies), 6):
            sheet.paste(_make_placeholder_enemy(i), (i * 16, 0))
    else:
        for i in range(6):
            sheet.paste(_make_placeholder_enemy(i), (i * 16, 0))

    return sheet


def _make_placeholder_enemy(variant):
    colors = [
        [8, 6, 1],   # knight (red)
        [10, 6, 1],  # fighter (yellow)
        [4, 5, 1],   # bishop (blue)
        [2, 12, 1],  # devil_flower (green)
        [8, 10, 1],  # flame (red/yellow)
        [13, 5, 1],  # witch (magenta)
    ]
    v = variant % len(colors)
    M, D, B = colors[v]
    T = 0
    rows = [
        [T,T,T,T,T,M,M,M,M,M,M,T,T,T,T,T],
        [T,T,T,T,M,M,M,M,M,M,M,M,T,T,T,T],
        [T,T,T,M,M,D,D,M,M,D,D,M,M,T,T,T],
        [T,T,T,M,M,B,D,M,M,B,D,M,M,T,T,T],
        [T,T,T,M,M,M,M,M,M,M,M,M,M,T,T,T],
        [T,T,T,T,M,M,D,D,D,D,M,M,T,T,T,T],
        [T,T,T,T,T,M,M,M,M,M,M,T,T,T,T,T],
        [T,T,T,D,D,D,D,D,D,D,D,D,D,T,T,T],
        [T,T,D,D,D,D,D,D,D,D,D,D,D,D,T,T],
        [T,T,D,T,D,D,D,D,D,D,D,D,T,D,T,T],
        [T,T,T,T,D,D,D,D,D,D,D,D,T,T,T,T],
        [T,T,T,T,D,D,T,T,T,T,D,D,T,T,T,T],
        [T,T,T,T,D,D,T,T,T,T,D,D,T,T,T,T],
        [T,T,T,D,D,D,T,T,T,T,D,D,D,T,T,T],
        [T,T,T,B,B,B,T,T,T,T,B,B,B,T,T,T],
        [T,T,T,B,B,T,T,T,T,T,T,B,B,T,T,T],
    ]
    img = Image.new("RGBA", (16, 16), TMS[0])
    px = img.load()
    for y, row in enumerate(rows):
        for x, c in enumerate(row):
            px[x, y] = TMS[c]
    return img


def generate_item_sprites():
    strip = Image.new("RGBA", (64, 8), (0, 0, 0, 0))

    def place(idx, img):
        strip.paste(img, (idx * 8, 0))

    T = 0

    # 0: gold key
    place(0, make_tile(
        [0x00, 0x1C, 0x24, 0x1C, 0x08, 0x0E, 0x08, 0x0E],
        [(10, 0)] * 8
    ))

    # 1: blue key
    place(1, make_tile(
        [0x00, 0x1C, 0x24, 0x1C, 0x08, 0x0E, 0x08, 0x0E],
        [(4, 0)] * 8
    ))

    # 2: red key
    place(2, make_tile(
        [0x00, 0x1C, 0x24, 0x1C, 0x08, 0x0E, 0x08, 0x0E],
        [(8, 0)] * 8
    ))

    # 3: crown
    place(3, make_tile(
        [0x00, 0x00, 0x42, 0xE7, 0xFF, 0xFF, 0xFF, 0x00],
        [(10, 0), (10, 0), (10, 0), (10, 0), (11, 0), (10, 0), (10, 0), (0, 0)]
    ))

    # 4: potion
    place(4, make_tile(
        [0x18, 0x18, 0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0x3C],
        [(0, 0), (15, 0), (15, 0), (2, 0), (2, 0), (3, 0), (3, 0), (2, 0)]
    ))

    # 5: map/scroll
    place(5, make_tile(
        [0x1E, 0x12, 0x1E, 0x10, 0x1E, 0x10, 0x1E, 0x0C],
        [(11, 0)] * 8
    ))

    # 6: door (closed)
    place(6, make_tile(
        [0xFF, 0xBD, 0xBD, 0xBD, 0xBF, 0xBD, 0xBD, 0xFF],
        [(6, 1)] * 8
    ))

    # 7: door (open)
    place(7, make_tile(
        [0xC3, 0xC1, 0xC1, 0xC1, 0xC1, 0xC1, 0xC1, 0xC3],
        [(6, 0)] * 8
    ))

    return strip


def main():
    os.makedirs(ASSETS_DIR, exist_ok=True)
    data = load_rom()
    print(f"ROM loaded: {len(data)} bytes")

    atlas = generate_tile_atlas(data)
    path = os.path.join(ASSETS_DIR, "tile_atlas.png")
    atlas.save(path)
    print(f"tile_atlas.png: {atlas.size[0]}x{atlas.size[1]}")

    room = generate_room_tiles()
    path = os.path.join(ASSETS_DIR, "room_tiles.png")
    room.save(path)
    print(f"room_tiles.png: {room.size[0]}x{room.size[1]}")

    player = generate_player_sprites(data)
    path = os.path.join(ASSETS_DIR, "player_sprites.png")
    player.save(path)
    print(f"player_sprites.png: {player.size[0]}x{player.size[1]}")

    enemy = generate_enemy_sprites(data)
    path = os.path.join(ASSETS_DIR, "enemy_sprites.png")
    enemy.save(path)
    print(f"enemy_sprites.png: {enemy.size[0]}x{enemy.size[1]}")

    items = generate_item_sprites()
    path = os.path.join(ASSETS_DIR, "item_sprites.png")
    items.save(path)
    print(f"item_sprites.png: {items.size[0]}x{items.size[1]}")

    print("Done.")


if __name__ == "__main__":
    main()
