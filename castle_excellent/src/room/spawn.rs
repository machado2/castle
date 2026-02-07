use bevy::prelude::*;
use crate::constants::*;
use crate::tile;
use crate::room::data::*;

#[derive(Component)]
pub struct InRoom;

#[derive(Component)]
pub struct RoomTile {
    pub row: usize,
    pub col: usize,
    pub tile_id: u8,
}

#[derive(Component)]
pub struct RoomObjectMarker {
    pub x: u8,
    pub y: u8,
    pub code: u8,
}

pub fn despawn_room(commands: &mut Commands, query: &Query<Entity, With<InRoom>>) {
    for entity in query.iter() {
        commands.entity(entity).despawn();
    }
}

pub fn spawn_room(commands: &mut Commands, room_db: &RoomDb, room_index: usize) {
    let room = room_db.get(room_index);

    for (row, tile_row) in room.tiles.iter().enumerate() {
        for (col, &tile_id) in tile_row.iter().enumerate() {
            if tile_id == 0 {
                continue;
            }
            let x = col as f32 * TILE_SIZE + TILE_SIZE / 2.0;
            let y = -(row as f32 * TILE_SIZE + TILE_SIZE / 2.0);
            let color = tile::tile_color(tile_id);

            commands.spawn((
                Sprite {
                    color,
                    custom_size: Some(Vec2::new(TILE_SIZE, TILE_SIZE)),
                    ..default()
                },
                Transform::from_xyz(x, y, 0.0),
                InRoom,
                RoomTile { row, col, tile_id },
            ));
        }
    }

    for obj in &room.objects {
        let x = obj.x as f32 * TILE_SIZE + TILE_SIZE / 2.0;
        let y = -(obj.y as f32 * TILE_SIZE + TILE_SIZE / 2.0);
        let color = if obj.code & 0x40 != 0 {
            Color::srgb(0.0, 0.78, 1.0)
        } else {
            Color::srgb(1.0, 0.86, 0.0)
        };

        commands.spawn((
            Sprite {
                color,
                custom_size: Some(Vec2::new(TILE_SIZE * 0.8, TILE_SIZE * 0.8)),
                ..default()
            },
            Transform::from_xyz(x, y, 1.0),
            InRoom,
            RoomObjectMarker {
                x: obj.x,
                y: obj.y,
                code: obj.code,
            },
        ));
    }
}
