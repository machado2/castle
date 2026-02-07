use bevy::prelude::*;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TileKind {
    Empty,
    Solid,
    Platform,
    Ladder,
    Hazard,
}

pub fn classify(tile_id: u8) -> TileKind {
    match tile_id {
        0 => TileKind::Empty,
        1..=3 => TileKind::Solid,
        4..=6 => TileKind::Platform,
        7 => TileKind::Ladder,
        8 => TileKind::Hazard,
        9 => TileKind::Empty,
        10..=11 => TileKind::Solid,
        12..=15 => TileKind::Solid,
        _ => TileKind::Empty,
    }
}

pub fn is_solid(tile_id: u8) -> bool {
    matches!(classify(tile_id), TileKind::Solid | TileKind::Platform)
}

pub fn is_ladder(tile_id: u8) -> bool {
    classify(tile_id) == TileKind::Ladder
}

pub fn tile_color(tile_id: u8) -> Color {
    match tile_id {
        0 => Color::srgba(0.0, 0.0, 0.0, 0.0),
        1 => Color::srgb(0.71, 0.31, 0.24),
        2 => Color::srgb(0.55, 0.24, 0.16),
        3 => Color::srgb(0.78, 0.39, 0.31),
        4 => Color::srgb(0.39, 0.39, 0.78),
        5 => Color::srgb(0.31, 0.31, 0.71),
        6 => Color::srgb(0.47, 0.47, 0.86),
        7 => Color::srgb(0.20, 0.78, 0.20),
        8 => Color::srgb(0.20, 0.71, 0.20),
        9 => Color::srgb(0.78, 0.78, 0.20),
        10 => Color::srgb(0.71, 0.20, 0.71),
        11 => Color::srgb(0.63, 0.20, 0.63),
        12 => Color::srgb(0.78, 0.59, 0.20),
        13 => Color::srgb(0.59, 0.78, 0.78),
        14 => Color::srgb(0.78, 0.78, 0.78),
        15 => Color::srgb(0.98, 0.98, 0.98),
        _ => Color::srgb(0.5, 0.5, 0.5),
    }
}
