# Castle Excellent (The Castle II) - ROM Map

**Platform:** MSX1 (TMS9918 VDP, AY-3-8910 PSG)  
**Size:** 32KB (32768 bytes)  
**Mapping:** $4000-$BFFF  
**Publisher:** ASCII Corporation, 1986  
**Credits:** Isao Yoshida (1985 original), Keisuke Iwakura (1986 sequel)

## ROM Header ($4000-$400F)

| Offset | Address | Content | Description |
|--------|---------|---------|-------------|
| $00-$01 | $4000 | $41 $42 | "AB" - MSX ROM signature |
| $02-$03 | $4002 | $10 $40 | Init address: $4010 |
| $04-$05 | $4004 | $00 $00 | Statement handler (unused) |
| $06-$07 | $4006 | $00 $00 | Device handler (unused) |
| $08-$09 | $4008 | $00 $00 | Text handler (unused) |

## Memory Layout

### Code Sections

| Address Range | Size | Description |
|---------------|------|-------------|
| $4010-$402A | 27B | Main program entry and game loop |
| $4029-$40BA | 146B | Game initialization and frame loop |
| $40BB-$0209 | ~350B | Movement/direction handling |
| $4210-$43FF | ~500B | Collision detection |
| $4400-$44FF | 256B | Sprite animation |
| $4500-$46FF | 512B | Input processing and joystick/trigger |
| $4700-$4CFF | ~1.5KB | Player update, physics |
| $4CA2-$4DFF | ~350B | Hardware initialization (VDP, PSG, RAM) |
| $4E00-$50FF | ~768B | Level completion / ending |
| $5100-$52FF | 512B | Player movement update |
| $5300-$56FF | 1KB | Item/object management |
| $5700-$5CFF | 1.5KB | Tile/map rendering |
| $5D00-$5EFF | 512B | Input reading (GTSTCK/GTTRIG) |
| $5F00-$62FF | 1KB | VDP display update, frame timing |
| $6300-$64FF | 512B | VDP setup, sprite initialization |
| $6400-$66FF | 768B | Level data loading/decompression |
| $6700-$6EFF | 2KB | Enemy AI and behavior |
| $6F00-$70FF | 512B | Scroll handling |
| $7100-$77FF | 1.75KB | Map processing, room transitions |
| $7800-$7BFF | 1KB | Music/sound driver |

### Data Sections

| Address Range | Size | Description |
|---------------|------|-------------|
| $567F-$56D4 | 86B | Credit strings (@ = newline separator) |
| $59D7-$59E2 | 12B | "MOONLIGHT" music title |
| $6467-$6491 | 43B | UI strings (GAME OVER, MAP, LOAD, SAVE, etc.) |
| $7810-$78D4 | 196B | PSG frequency table (96 entries: 12 notes × 8 octaves, 16-bit periods) |
| $78D4-$7AAC | 472B | Music melody data (ASCII-encoded notes: '0'-'9','`','<',';' etc.) |
| $7AAC-$7CEE | ~578B | Additional music sequences and PSG envelope data |
| $7CEE-$7DA6 | ~185B | Room pointer table (~100 entries) |
| $7DA6-$7FEF | ~580B | Compressed screen/tile layout data |
| $7FEF-$7FFF | 17B | Copyright: "(C) 1986 K.I/I.Y" |
| $8000-$83FF | 1KB | Additional tile layout / screen data |
| $8400-$91FF | ~3.5KB | Code (enemy routines, continued) |
| $9200-$9BFF | 2.5KB | Tile pattern data (8x8 pixel bitmaps) |
| $9C00-$A3FF | 2KB | Color table data (TMS9918 format) |
| $A396-$B171 | ~3.5KB | Compressed room/level map data |

## Key RAM Variables ($E000-$EAFF)

| Address | Description |
|---------|-------------|
| $E324 | Demo mode flag |
| $E334-$E335 | VRAM base addresses |
| $E386-$E3D6 | Object/entity table (16 entries × 5 bytes) |
| $E3E4-$E416 | Additional entity data |
| $EAC9 | Current room number |
| $EACB-$EACC | Player X,Y position |
| $EAD6 | Player direction/movement state |
| $EAE0 | Game over flag |
| $EAE1 | Level complete flag |
| $EAE2 | Pause flag |
| $EAE3 | Quit/exit flag |
| $EAE8 | Rendering/update flag |
| $EAEE-$EAF0 | Entity data |
| $EAF1-$EAF2 | Score (BCD) |
| $EAF4-$EAF5 | Lives / keys collected |
| $EAFA | PSG current channel |
| $EAFB-$EAFC | Music pointer |
| $EAFD | Music tempo counter |

## BIOS Calls Used

| Address | Function | Count | Purpose |
|---------|----------|-------|---------|
| $004D | CHGMOD | 24 | Set screen mode (1, 2, or multicolor) |
| $0093 | WRTPSG | 24 | Write to PSG sound chip |
| $004A | LDIRMV | 6 | Block transfer VRAM→RAM |
| $00E4 | GTTRIG | 4 | Read trigger button |
| $00E1 | GTSTCK | 1 | Read joystick direction |
| $00E7 | GTPAD | 2 | Read touch pad |
| $0056 | CLRSPR | 3 | Clear all sprites |
| $0047 | WRTVRM | 1 | Write single VRAM byte |
| $0024 | RDVRM | 1 | Read single VRAM byte |
| $005C | INIT32 | 1 | Initialize Screen 1 (32-col) |
| $0062 | INIMLT | 1 | Initialize Multicolor mode |
| $0090 | GICINI | 1 | Initialize PSG |
| $00D8 | ERAFNK | 1 | Erase function key display |

## String Table

| ROM Offset | Address | Content |
|------------|---------|---------|
| $167F | $567F | "[ 1985 ISAO YOSHIDA" |
| $1694 | $5694 | "[ 1986 KEISUKE IWAKURA" |
| $16AB | $56AB | "PRESENTED" |
| $16B5 | $56B5 | "BY" |
| $16B8 | $56B8 | "ASCII CORPORATION" |
| $16CA | $56CA | "DEMO" |
| $16CF | $56CF | "GAME" |
| $19D7 | $59D7 | " MOONLIGHT" (BGM title) |
| $2467 | $6467 | "GAME  OVER" |
| $2472 | $6472 | "N O" |
| $2476 | $6476 | "MAP" |
| $247A | $647A | "LOAD" |
| $247F | $647F | "SAVE" |
| $2484 | $6484 | "GAME" |
| $2489 | $6489 | "Y OR N" |
| $3FEF | $7FEF | "(C) 1986 K.I/I.Y" |

## Program Flow

```
ENTRY ($4010)
  ├── hardware_init ($4CA2) - Set up VDP, PSG, clear RAM
  │
  ├── TITLE LOOP ($4016)
  │   ├── vdp_setup ($6383) - Configure screen mode
  │   ├── title_display ($4D52) - Show title screen
  │   └── title_menu ($4A4A) - DEMO/GAME selection
  │       ├── Returns C flag = restart title
  │       └── Returns NC = start game
  │
  └── GAME LOOP ($401C → $4029)
      ├── init_game_vars ($4029) - Clear score, lives, room
      ├── load_level ($64DD) - Load room data
      ├── init_level ($404B) - Set up level state
      │
      └── FRAME LOOP ($4064)
          ├── read_input ($5D5D)
          ├── vdp_setup ($6383)
          ├── update_player ($5128)
          ├── update_display ($62D8)
          ├── check_collision ($5B96)
          ├── update_enemies ($442D)
          ├── update_items ($434A)
          ├── handle_movement ($40BB)
          ├── update_scroll ($6F5C)
          ├── animate_sprites ($4406)
          ├── check_doors ($438D)
          ├── check_keys ($4499)
          ├── update_score ($5A2D)
          ├── check_level_complete ($5053)
          ├── advance_frame ($623C)
          └── Loop back to FRAME LOOP
```

## Graphics System

- **Screen Mode:** Screen 2 (256×192 bitmap mode)
- **Tile Size:** 8×8 pixels
- **Color:** TMS9918 - 2 colors per 8-pixel row (foreground/background nibbles)
- **Sprites:** 16×16 mode, up to 32 sprites (4 per scanline limit)
- **Animation:** Frame-based sprite pattern swapping

### TMS9918 Color Palette
| # | Color | RGB |
|---|-------|-----|
| 0 | Transparent | — |
| 1 | Black | (0,0,0) |
| 2 | Medium Green | (33,200,66) |
| 3 | Light Green | (94,220,120) |
| 4 | Dark Blue | (84,85,237) |
| 5 | Light Blue | (125,118,252) |
| 6 | Dark Red | (212,82,77) |
| 7 | Cyan | (66,235,245) |
| 8 | Medium Red | (252,85,84) |
| 9 | Light Red | (255,121,120) |
| 10 | Dark Yellow | (212,193,84) |
| 11 | Light Yellow | (230,206,128) |
| 12 | Dark Green | (33,176,59) |
| 13 | Magenta | (201,91,186) |
| 14 | Gray | (204,204,204) |
| 15 | White | (255,255,255) |
