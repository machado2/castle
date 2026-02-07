use bevy::prelude::*;
use crate::constants::*;
use crate::player::components::*;
use crate::room::data::{CurrentRoom, RoomDb};
use crate::tile;

const PLAYER_HALF_W: f32 = 5.0;
const PLAYER_HALF_H: f32 = 7.0;
const EPSILON: f32 = 0.01;

fn is_tile_solid(room_db: &RoomDb, room_index: usize, row: i32, col: i32) -> bool {
    if row < 0 || col < 0 || row >= ROOM_ROWS as i32 || col >= ROOM_COLS as i32 {
        return false;
    }
    tile::is_solid(room_db.tile_at(room_index, row as usize, col as usize))
}

fn tile_aabb(row: i32, col: i32) -> (f32, f32, f32, f32) {
    let tx = col as f32 * TILE_SIZE;
    let ty = row as f32 * TILE_SIZE;
    (tx, ty, tx + TILE_SIZE, ty + TILE_SIZE)
}

pub fn resolve_tile_collisions(
    room_db: Res<RoomDb>,
    current_room: Res<CurrentRoom>,
    mut query: Query<(&mut Transform, &mut Velocity, &mut PlayerState), With<Player>>,
) {
    let Ok((mut transform, mut velocity, mut state)) = query.get_single_mut() else {
        return;
    };

    let room = current_room.index;
    let pos = &mut transform.translation;

    // Player AABB in tile-space: tile-space Y = -world Y
    // Player center in tile-space: (pos.x, -pos.y)
    let px = pos.x;
    let py = -pos.y;

    // --- X axis resolution ---
    {
        let left = px - PLAYER_HALF_W;
        let right = px + PLAYER_HALF_W;
        let top = py - PLAYER_HALF_H + 1.0;
        let bottom = py + PLAYER_HALF_H - 1.0;

        let col_left = (left / TILE_SIZE).floor() as i32;
        let col_right = (right / TILE_SIZE).floor() as i32;
        let row_top = (top / TILE_SIZE).floor() as i32;
        let row_bottom = (bottom / TILE_SIZE).floor() as i32;

        if velocity.x > 0.0 {
            for row in row_top..=row_bottom {
                if is_tile_solid(&room_db, room, row, col_right) {
                    pos.x = col_right as f32 * TILE_SIZE - PLAYER_HALF_W - EPSILON;
                    velocity.x = 0.0;
                    break;
                }
            }
        }
        if velocity.x < 0.0 {
            for row in row_top..=row_bottom {
                if is_tile_solid(&room_db, room, row, col_left) {
                    pos.x = (col_left + 1) as f32 * TILE_SIZE + PLAYER_HALF_W + EPSILON;
                    velocity.x = 0.0;
                    break;
                }
            }
        }
    }

    // --- Y axis resolution ---
    {
        let px = pos.x;
        let py = -pos.y;
        let left = px - PLAYER_HALF_W + 1.0;
        let right = px + PLAYER_HALF_W - 1.0;
        let top = py - PLAYER_HALF_H;
        let bottom = py + PLAYER_HALF_H;

        let col_left = (left / TILE_SIZE).floor() as i32;
        let col_right = (right / TILE_SIZE).floor() as i32;
        let row_top = (top / TILE_SIZE).floor() as i32;
        let row_bottom = (bottom / TILE_SIZE).floor() as i32;

        state.on_ground = false;

        if velocity.y < 0.0 {
            for col in col_left..=col_right {
                if is_tile_solid(&room_db, room, row_bottom, col) {
                    let tile_top = row_bottom as f32 * TILE_SIZE;
                    pos.y = -(tile_top - PLAYER_HALF_H + EPSILON);
                    velocity.y = 0.0;
                    state.on_ground = true;
                    break;
                }
            }
        }
        if velocity.y > 0.0 {
            for col in col_left..=col_right {
                if is_tile_solid(&room_db, room, row_top, col) {
                    let tile_bottom = (row_top + 1) as f32 * TILE_SIZE;
                    pos.y = -(tile_bottom + PLAYER_HALF_H + EPSILON);
                    velocity.y = 0.0;
                    break;
                }
            }
        }
    }

    // --- Penetration unstick pass ---
    // Handles case where player starts inside a solid tile
    for _ in 0..4 {
        let px = pos.x;
        let py = -pos.y;
        let p_left = px - PLAYER_HALF_W;
        let p_right = px + PLAYER_HALF_W;
        let p_top = py - PLAYER_HALF_H;
        let p_bottom = py + PLAYER_HALF_H;

        let col_min = (p_left / TILE_SIZE).floor() as i32;
        let col_max = (p_right / TILE_SIZE).floor() as i32;
        let row_min = (p_top / TILE_SIZE).floor() as i32;
        let row_max = (p_bottom / TILE_SIZE).floor() as i32;

        let mut best_push: Option<(f32, f32)> = None;
        let mut best_depth = f32::MAX;

        for row in row_min..=row_max {
            for col in col_min..=col_max {
                if !is_tile_solid(&room_db, room, row, col) {
                    continue;
                }
                let (tx0, ty0, tx1, ty1) = tile_aabb(row, col);

                let overlap_x = (p_right - tx0).min(tx1 - p_left);
                let overlap_y = (p_bottom - ty0).min(ty1 - p_top);

                if overlap_x <= 0.0 || overlap_y <= 0.0 {
                    continue;
                }

                if overlap_x < overlap_y {
                    if overlap_x < best_depth {
                        best_depth = overlap_x;
                        let push_dir = if px < (tx0 + tx1) / 2.0 { -1.0 } else { 1.0 };
                        best_push = Some((push_dir * (overlap_x + EPSILON), 0.0));
                    }
                } else if overlap_y < best_depth {
                    best_depth = overlap_y;
                    let push_dir = if py < (ty0 + ty1) / 2.0 { -1.0 } else { 1.0 };
                    best_push = Some((0.0, push_dir * (overlap_y + EPSILON)));
                }
            }
        }

        if let Some((dx, dy)) = best_push {
            pos.x += dx;
            pos.y -= dy; // tile-space Y push to world Y
            if dy.abs() > 0.0 {
                velocity.y = 0.0;
                if dy > 0.0 {
                    state.on_ground = true;
                }
            }
            if dx.abs() > 0.0 {
                velocity.x = 0.0;
            }
        } else {
            break;
        }
    }
}
