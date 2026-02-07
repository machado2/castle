pub mod components;
pub mod input;
pub mod movement;

use bevy::prelude::*;
use crate::constants::*;
use crate::game_state::GameState;
use crate::room::data::{CurrentRoom, RoomDb};
use crate::tile;

pub struct PlayerPlugin;

impl Plugin for PlayerPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<components::PlayerInput>()
            .init_resource::<components::Inventory>()
            .add_systems(OnEnter(GameState::Playing), spawn_player);
    }
}

fn find_spawn_position(room_db: &RoomDb, room_index: usize) -> (f32, f32) {
    let room = room_db.get(room_index);
    for row in (0..ROOM_ROWS - 1).rev() {
        for col in 0..ROOM_COLS {
            let here = room.tiles[row][col];
            let below = room.tiles[row + 1][col];
            if !tile::is_solid(here) && tile::is_solid(below) {
                let x = col as f32 * TILE_SIZE + TILE_SIZE / 2.0;
                let y = -(row as f32 * TILE_SIZE + TILE_SIZE / 2.0);
                return (x, y);
            }
        }
    }
    (ROOM_WIDTH / 2.0, -ROOM_HEIGHT / 2.0)
}

fn spawn_player(
    mut commands: Commands,
    asset_server: Res<AssetServer>,
    room_db: Res<RoomDb>,
    current_room: Res<CurrentRoom>,
) {
    let (x, y) = find_spawn_position(&room_db, current_room.index);

    let texture = asset_server.load("player.png");

    commands.spawn((
        Sprite {
            image: texture,
            custom_size: Some(Vec2::new(16.0, 16.0)),
            rect: Some(Rect::new(0.0, 0.0, 16.0, 16.0)),
            ..default()
        },
        Transform::from_xyz(x, y, 10.0),
        components::Player,
        components::Velocity::default(),
        components::PlayerState { facing_right: true, ..default() },
    ));
}
