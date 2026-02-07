#!/usr/bin/env python3
"""Generate object_codes.json from Castle Excellent room data and ROM analysis.

Object code encoding (from ROM routine at L69DF):
  Raw code = (byte1_high3 | byte0_high4) where byte0/byte1 are the 2-byte ROM object record
  Entity type = (code & 0x0F) + 0x20 if bit6 set, else + 0x30

Entity type dispatch (L5F1A):
  < 0x30: Items (E3D6 table, 4 bytes each, max 16)
  0x30-0x35: Enemies (E386 table, 5 bytes each, max 16)
  >= 0x36: Interactive/doors (E416 table, 5 bytes each, max 8)

Additional code bits:
  bit7: persistence/state flag (used by L60EB bitmap check)
  bit5: initial direction (0=right, 1=left) for enemies/interactive objects

Game reference: StrategyWiki Castle Excellent
  Enemies: Knight, Fighter, Bishop, Devil Flower, Flame, Witch
  Items: 6 colored keys, Oxygen tank, Potion (extra life), Castle Map, treasures (Cross/Ring/Money bag)
  Obstacles: Doors, Elevators, Floating platforms, Conveyor belts, Barriers, etc.
"""

import json
from collections import Counter, defaultdict

with open('/home/fabio/src/c2/castle_excellent/assets/rooms.json') as f:
    data = json.load(f)

code_counts = Counter()
code_rooms = defaultdict(list)
room_object_details = {}

for room in data['rooms']:
    rid = room['id']
    objs = room.get('objects', [])
    room_object_details[rid] = []
    for obj in objs:
        code = obj['code']
        code_counts[code] += 1
        code_rooms[code].append(rid)
        room_object_details[rid].append(obj)


def decode_entity_type(code):
    low = code & 0x0F
    bit6 = (code >> 6) & 1
    return low + 0x20 if bit6 else low + 0x30


def classify_object(code):
    et = decode_entity_type(code)
    bit5 = (code >> 5) & 1
    bit7 = (code >> 7) & 1
    direction = "left" if bit5 else "right"

    if et < 0x30:
        # Items - dispatched in L5BCA-L5CA7
        item_map = {
            0x20: ("item", "crown", "Crown - special goal item (sets game flag)"),
            0x21: ("item", "princess", "Princess - rescue target (triggers cutscene)"),
            0x22: ("item", "power_up", "Power-up item (sets ability flag)"),
            0x23: ("item", "potion", "Potion - extra life (1000 pts)"),
            0x24: ("item", "oxygen_tank", "Oxygen tank - allows underwater breathing"),
            0x25: ("item", "castle_map", "Castle Map - shows room layout (1000 pts)"),
            0x26: ("item", "key_door_opener", "Key/door counter increment"),
            0x27: ("item", "treasure_high", "Treasure - high value (2048 pts, Cross)"),
            0x28: ("item", "treasure_mid", "Treasure - medium value (1024 pts, Ring)"),
            0x29: ("item", "treasure_low", "Treasure - low value (512 pts, Money bag)"),
            0x2A: ("item", "key_red", "Red key (1024 pts)"),
            0x2B: ("item", "key_orange", "Orange key (512 pts)"),
            0x2C: ("item", "key_yellow", "Yellow key (256 pts)"),
            0x2D: ("item", "key_green", "Green key (80 pts)"),
            0x2E: ("item", "key_blue", "Blue key (32 pts)"),
            0x2F: ("item", "key_purple", "Purple key (16 pts)"),
        }
        if et in item_map:
            cat, kind, desc = item_map[et]
        else:
            cat, kind, desc = "item", "unknown_item", f"Unknown item (entity type 0x{et:02X})"

    elif et <= 0x35:
        # Enemies - dispatched in L434A, behavior in L4820
        # 6 enemy types from StrategyWiki: Knight, Fighter, Bishop, Devil Flower, Flame, Witch
        enemy_map = {
            0x30: ("enemy", "knight", "Knight - patrols and fires arrows"),
            0x31: ("enemy", "fighter", "Fighter - melee, jumps when player jumps"),
            0x32: ("enemy", "bishop", "Bishop - immune to dagger, patrols area"),
            0x33: ("enemy", "devil_flower", "Devil Flower - grows from bud, stationary hazard"),
            0x34: ("enemy", "flame", "Flame - roams room seeking player, immune to dagger"),
            0x35: ("enemy", "witch", "Witch - summons other enemies"),
        }
        if et in enemy_map:
            cat, kind, desc = enemy_map[et]
        else:
            cat, kind, desc = "enemy", "unknown_enemy", f"Unknown enemy (entity type 0x{et:02X})"

    else:
        # Interactive objects - dispatched in L43BF
        # 0x36: simple animation (door)
        # 0x37: L4901 (horizontal floating platform)
        # 0x38: L48AD (elevator / vertical platform)
        # 0x39: L4882 (conveyor belt / barrier)
        # 0x3A: L487A (another moving object pattern)
        # default (0x3B+): L4872 (basic movement - pushable objects)
        interactive_map = {
            0x36: ("interactive", "door", "Door - opens with matching colored key"),
            0x37: ("interactive", "floating_platform", "Floating platform - horizontal movement (L4901)"),
            0x38: ("interactive", "elevator", "Elevator - vertical movement (L48AD)"),
            0x39: ("interactive", "barrier", "Barrier/conveyor - periodic activation (L4882)"),
            0x3A: ("interactive", "moving_hazard", "Moving hazard/obstacle (L487A)"),
            0x3B: ("interactive", "pushable_object", "Pushable object - block/brick/barrel (L4872)"),
            0x3C: ("interactive", "candle", "Candle/special pushable - hazardous top (L4872)"),
        }
        if et in interactive_map:
            cat, kind, desc = interactive_map[et]
        else:
            cat, kind, desc = "interactive", "unknown_interactive", f"Unknown interactive (entity type 0x{et:02X})"

    return {
        "category": cat,
        "kind": kind,
        "description": desc,
        "entity_type": et,
        "entity_type_hex": f"0x{et:02X}",
        "initial_direction": direction,
        "persistence_flag": bool(bit7),
    }


objects = []
for code in sorted(code_counts.keys()):
    info = classify_object(code)
    rooms = sorted(set(code_rooms[code]))
    obj_entry = {
        "code": code,
        "hex": f"0x{code:02X}",
        "category": info["category"],
        "kind": info["kind"],
        "description": info["description"],
        "entity_type": info["entity_type"],
        "entity_type_hex": info["entity_type_hex"],
        "initial_direction": info["initial_direction"],
        "persistence_flag": info["persistence_flag"],
        "count": code_counts[code],
        "rooms": rooms,
    }
    objects.append(obj_entry)

# Per-room summary
room_summaries = []
for room in data['rooms']:
    rid = room['id']
    objs = room.get('objects', [])
    if not objs:
        room_summaries.append({
            "room_id": rid,
            "total_objects": 0,
            "items": 0,
            "enemies": 0,
            "interactive": 0,
            "object_codes": [],
        })
        continue

    items = 0
    enemies = 0
    interactive = 0
    codes_in_room = []
    for obj in objs:
        info = classify_object(obj['code'])
        if info['category'] == 'item':
            items += 1
        elif info['category'] == 'enemy':
            enemies += 1
        else:
            interactive += 1
        codes_in_room.append({
            "code": obj['code'],
            "hex": f"0x{obj['code']:02X}",
            "kind": info['kind'],
            "x": obj['x'],
            "y": obj['y'],
        })

    room_summaries.append({
        "room_id": rid,
        "total_objects": len(objs),
        "items": items,
        "enemies": enemies,
        "interactive": interactive,
        "object_codes": codes_in_room,
    })

# Category totals
cat_counts = Counter()
kind_counts = Counter()
for code, count in code_counts.items():
    info = classify_object(code)
    cat_counts[info['category']] += count
    kind_counts[info['kind']] += count

output = {
    "metadata": {
        "game": "Castle Excellent (The Castle II)",
        "platform": "MSX1",
        "publisher": "ASCII Corporation, 1986",
        "rom_file": "rom.MX1",
        "total_rooms": len(data['rooms']),
        "total_object_instances": sum(code_counts.values()),
        "unique_codes": len(code_counts),
        "encoding_notes": {
            "raw_code": "code = (byte1 & 0xE0) | (byte0 >> 4), from 2-byte ROM object record",
            "entity_type": "(code & 0x0F) + 0x20 if bit6 set, else (code & 0x0F) + 0x30",
            "bit5": "Initial direction: 0=right, 1=left",
            "bit7": "Persistence/state bitmap flag",
            "dispatch_routine": "L5F1A at ROM $5F1A",
        },
        "category_totals": {
            "item": cat_counts.get("item", 0),
            "enemy": cat_counts.get("enemy", 0),
            "interactive": cat_counts.get("interactive", 0),
        },
    },
    "entity_type_reference": {
        "items_0x20_to_0x2F": {
            "table": "E3D6 (4 bytes per entry, max 16)",
            "types": {
                "0x20": "Crown (goal item)",
                "0x21": "Princess (rescue target)",
                "0x22": "Power-up",
                "0x23": "Potion (extra life)",
                "0x24": "Oxygen tank",
                "0x25": "Castle Map",
                "0x26": "Key/door counter",
                "0x27": "Cross (2048 pts)",
                "0x28": "Ring (1024 pts)",
                "0x29": "Money bag (512 pts)",
                "0x2A": "Red key (1024 pts)",
                "0x2B": "Orange key (512 pts)",
                "0x2C": "Yellow key (256 pts)",
                "0x2D": "Green key (80 pts)",
                "0x2E": "Blue key (32 pts)",
                "0x2F": "Purple key (16 pts)",
            },
        },
        "enemies_0x30_to_0x35": {
            "table": "E386 (5 bytes per entry, max 16)",
            "types": {
                "0x30": "Knight (ranged, fires arrows)",
                "0x31": "Fighter (melee, jumps with player)",
                "0x32": "Bishop (immune to dagger)",
                "0x33": "Devil Flower (stationary, grows from bud)",
                "0x34": "Flame (roaming, immune to dagger)",
                "0x35": "Witch (summons enemies)",
            },
        },
        "interactive_0x36_plus": {
            "table": "E416 (5 bytes per entry, max 8)",
            "dispatch": "L43BF",
            "types": {
                "0x36": "Door (simple animation)",
                "0x37": "Floating platform (horizontal, L4901)",
                "0x38": "Elevator (vertical, L48AD)",
                "0x39": "Barrier (periodic activation, L4882)",
                "0x3A": "Moving hazard (L487A)",
                "0x3B": "Pushable object (L4872)",
                "0x3C": "Candle/special pushable (L4872)",
            },
        },
    },
    "objects": objects,
    "room_summary": room_summaries,
}

with open('/home/fabio/src/c2/castle_excellent/assets/object_codes.json', 'w') as f:
    json.dump(output, f, indent=2)

# Print summary
print("=== Castle Excellent Object Code Analysis ===\n")
print(f"Total rooms: {len(data['rooms'])}")
print(f"Total object instances: {sum(code_counts.values())}")
print(f"Unique codes: {len(code_counts)}\n")

print("Category totals:")
for cat in ['item', 'enemy', 'interactive']:
    print(f"  {cat}: {cat_counts.get(cat, 0)} instances")

print(f"\nObjects by kind:")
for kind, count in sorted(kind_counts.items(), key=lambda x: -x[1]):
    print(f"  {kind:25s}: {count:3d}")

print(f"\n=== Object Code Details ===\n")
print(f"{'Code':>6s}  {'Entity':>6s}  {'Count':>5s}  {'Category':>12s}  {'Kind':>25s}  Description")
print("-" * 110)
for obj in objects:
    print(f"{obj['hex']:>6s}  {obj['entity_type_hex']:>6s}  {obj['count']:>5d}  {obj['category']:>12s}  {obj['kind']:>25s}  {obj['description']}")

print(f"\n=== Per-Room Distribution ===\n")
print(f"{'Room':>4s}  {'Total':>5s}  {'Items':>5s}  {'Enemy':>5s}  {'Inter':>5s}  Objects")
print("-" * 80)
for rs in room_summaries:
    codes_str = ", ".join(f"{c['hex']}({c['kind'][:8]})" for c in rs['object_codes'][:8])
    if len(rs['object_codes']) > 8:
        codes_str += f" +{len(rs['object_codes'])-8} more"
    print(f"{rs['room_id']:>4d}  {rs['total_objects']:>5d}  {rs['items']:>5d}  {rs['enemies']:>5d}  {rs['interactive']:>5d}  {codes_str}")

print(f"\nOutput written to castle_excellent/assets/object_codes.json")
