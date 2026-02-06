#!/usr/bin/env python3
"""Extract music data from Castle Excellent ROM."""

import struct

data = open('/home/fabio/src/c2/rom.MX1', 'rb').read()
BASE = 0x4000

# Find all WRTPSG calls and their context
# WRTPSG = CALL $0093, so look for CD 93 00
print("=== PSG WRITE CALLS ===")
for i in range(len(data)-2):
    if data[i] == 0xCD and data[i+1] == 0x93 and data[i+2] == 0x00:
        addr = i + BASE
        # Look at preceding bytes for register/value setup
        # Typical pattern: LD E,reg / LD A,val / CALL WRTPSG
        # or LD A,reg / LD E,val pattern
        ctx_start = max(0, i-10)
        ctx = data[ctx_start:i+3]
        print(f"  ${addr:04X}: context={ctx.hex()}")

# Music data around MOONLIGHT reference
moon_off = data.find(b' MOONLIGHT')
print(f"\n=== MOONLIGHT string at ROM offset 0x{moon_off:04X} (${moon_off+BASE:04X}) ===")

# Look at the music-related code that references this string
# The music data at 0x38D4 contains encoded melody
print("\n=== ENCODED MELODY DATA ===")
# These are the digit-like strings that encode musical notes
# Characters '0'-'9' and '`' seem to be note encodings
music_off = 0x38D4
for line_start in range(music_off, min(music_off + 512, len(data))):
    if data[line_start] == 0x00:
        break

music_bytes = data[music_off:line_start]
print(f"Music data at 0x{music_off:04X}-0x{line_start:04X} ({line_start-music_off} bytes)")
print(f"Hex: {music_bytes[:64].hex()}")
print(f"ASCII: {music_bytes[:64].decode('ascii', errors='replace')}")

# The data after 0x3900 looks like it could be note sequences
# Let's decode based on MSX music encoding conventions
print("\n=== NOTE SEQUENCES ===")
# Look at patterns: sequences of bytes that represent musical notes
# In many MSX games, notes are encoded as: duration + pitch pairs
for start in range(0x38D4, 0x3B00):
    if data[start:start+2] == b'\x00\x00':
        seq = data[0x38D4:start]
        print(f"Sequence length: {len(seq)} bytes")
        break

# Also look for PSG frequency table
# Standard note frequencies for AY-3-8910 at 1.7897725 MHz clock
# A4 = 440Hz -> period = 1789772.5 / (16 * 440) = 254
print("\n=== LOOKING FOR FREQUENCY TABLE ===")
# Search for descending 16-bit values that could be note periods
for off in range(len(data) - 24):
    vals = [data[off+i] | (data[off+i+1] << 8) for i in range(0, 24, 2)]
    # Check if descending (higher period = lower frequency)
    if all(200 < v < 4096 for v in vals):
        if all(vals[i] > vals[i+1] for i in range(len(vals)-1)):
            print(f"  Descending freq table at 0x{off:04X}: {[hex(v) for v in vals]}")

# Export the raw music data
with open('/home/fabio/src/c2/assets/music_data.bin', 'wb') as f:
    f.write(data[0x38D4:0x3B00])
print(f"\nRaw music data exported to assets/music_data.bin ({0x3B00-0x38D4} bytes)")

# Export level/room pointer table
print("\n=== ROOM POINTER TABLE ===")
ptr_off = 0x3CEE  # ROM offset for the pointer table at $7CEE
ptrs = []
for i in range(0, 200, 2):
    if ptr_off + i + 1 >= len(data):
        break
    addr = data[ptr_off + i] | (data[ptr_off + i + 1] << 8)
    if 0x4000 <= addr < 0xC000:
        ptrs.append(addr)
    else:
        break

print(f"Found {len(ptrs)} room pointers at ${ptr_off+BASE:04X}")
for i, p in enumerate(ptrs):
    rom_off = p - BASE
    room_data = data[rom_off:rom_off+8]
    print(f"  Room {i:3d}: ${p:04X} (ROM 0x{rom_off:04X}) data={room_data.hex()}")

with open('/home/fabio/src/c2/assets/room_pointers.txt', 'w') as f:
    for i, p in enumerate(ptrs):
        f.write(f"Room {i:3d}: ${p:04X}\n")

print("\nDone.")
