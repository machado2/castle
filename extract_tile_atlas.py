#!/usr/bin/env python3
"""Extract tile graphics from Castle Excellent MSX ROM and generate a tile atlas PNG.

Tile data at ROM offset 0x5200 (CPU $9200): 160 tiles in interleaved pattern+color format.
Each tile is 16 bytes: 8 rows × (pattern_byte, color_byte).
Pattern byte is a 1bpp bitmap; color byte high nibble = foreground, low nibble = background.

Output:
  - tile_atlas.png: 16×10 grid of 8×8 tiles (128×80 px), native resolution
  - tile_atlas_preview.png: same at 4× scale for visual inspection
"""

import os
from PIL import Image

ROM_PATH = "/home/fabio/src/c2/rom.MX1"
ASSETS_DIR = "/home/fabio/src/c2/castle_excellent/assets"

TILE_DATA_OFFSET = 0x5200
TILE_COUNT = 160
TILE_SIZE = 8
BYTES_PER_TILE = 16
ATLAS_COLS = 16
ATLAS_ROWS = 10
PREVIEW_SCALE = 4

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


def load_rom():
    with open(ROM_PATH, "rb") as f:
        return f.read()


def render_tile(data, offset):
    img = Image.new("RGBA", (TILE_SIZE, TILE_SIZE))
    pixels = img.load()
    for row in range(TILE_SIZE):
        pat = data[offset + row * 2]
        col = data[offset + row * 2 + 1]
        fg = (col >> 4) & 0xF
        bg = col & 0xF
        for bit in range(TILE_SIZE):
            is_set = (pat >> (7 - bit)) & 1
            pixels[bit, row] = TMS9918_PALETTE[fg if is_set else bg]
    return img


def main():
    os.makedirs(ASSETS_DIR, exist_ok=True)
    data = load_rom()
    print(f"ROM loaded: {len(data)} bytes")

    atlas_w = ATLAS_COLS * TILE_SIZE
    atlas_h = ATLAS_ROWS * TILE_SIZE
    atlas = Image.new("RGBA", (atlas_w, atlas_h))

    for i in range(TILE_COUNT):
        offset = TILE_DATA_OFFSET + i * BYTES_PER_TILE
        tile = render_tile(data, offset)
        x = (i % ATLAS_COLS) * TILE_SIZE
        y = (i // ATLAS_COLS) * TILE_SIZE
        atlas.paste(tile, (x, y))

    atlas_path = os.path.join(ASSETS_DIR, "tile_atlas.png")
    atlas.save(atlas_path)
    print(f"Tile atlas saved: {atlas_path} ({atlas_w}x{atlas_h})")

    preview = atlas.resize(
        (atlas_w * PREVIEW_SCALE, atlas_h * PREVIEW_SCALE), Image.NEAREST
    )
    preview_path = os.path.join(ASSETS_DIR, "tile_atlas_preview.png")
    preview.save(preview_path)
    print(f"Preview saved: {preview_path} ({preview.width}x{preview.height})")


if __name__ == "__main__":
    main()
