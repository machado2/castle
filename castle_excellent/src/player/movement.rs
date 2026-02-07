use bevy::prelude::*;
use crate::constants::*;
use crate::room::data::{CurrentRoom, RoomDb};
use crate::tile;
use super::components::*;

pub fn apply_player_movement(
    input: Res<PlayerInput>,
    room_db: Res<RoomDb>,
    current_room: Res<CurrentRoom>,
    mut query: Query<(&mut Transform, &mut Velocity, &mut PlayerState, &mut Sprite), With<Player>>,
    time: Res<Time>,
) {
    let Ok((mut transform, mut velocity, mut state, mut sprite)) = query.get_single_mut() else {
        return;
    };
    let dt = time.delta_secs();

    let player_col = (transform.translation.x / TILE_SIZE).floor() as i32;
    let player_row = ((-transform.translation.y) / TILE_SIZE).floor() as i32;

    let col = player_col.clamp(0, ROOM_COLS as i32 - 1) as usize;
    let row = player_row.clamp(0, ROOM_ROWS as i32 - 1) as usize;

    let on_ladder_tile = tile::is_ladder(room_db.tile_at(current_room.index, row, col));

    let ladder_below = row + 1 < ROOM_ROWS
        && tile::is_ladder(room_db.tile_at(current_room.index, row + 1, col));

    velocity.x = input.move_x * PLAYER_SPEED;
    if input.move_x > 0.0 {
        state.facing_right = true;
        sprite.flip_x = false;
    } else if input.move_x < 0.0 {
        state.facing_right = false;
        sprite.flip_x = true;
    }

    if on_ladder_tile || (ladder_below && input.move_y < 0.0) {
        if input.move_y != 0.0 {
            state.on_ladder = true;
            velocity.y = input.move_y * CLIMB_SPEED;
        } else if state.on_ladder && !state.on_ground {
            velocity.y = 0.0;
        } else {
            state.on_ladder = false;
        }
    } else {
        state.on_ladder = false;
    }

    if !state.on_ladder {
        velocity.y -= GRAVITY * dt;
    }

    if input.jump_pressed && state.on_ground && !state.on_ladder {
        velocity.y = JUMP_VELOCITY;
        state.on_ground = false;
    }

    transform.translation.x += velocity.x * dt;
    transform.translation.y += velocity.y * dt;
}
