use bevy::prelude::*;
use crate::constants::*;
use crate::room::data::CurrentRoom;
use crate::room::spawn::InRoom;
use crate::player::components::Player;

#[derive(Event)]
pub struct RoomChangeEvent {
    pub new_grid_x: usize,
    pub new_grid_y: usize,
}

pub fn check_room_transition(
    player_query: Query<&Transform, With<Player>>,
    current_room: Res<CurrentRoom>,
    mut room_change_events: EventWriter<RoomChangeEvent>,
) {
    let Ok(transform) = player_query.get_single() else {
        return;
    };
    let pos = transform.translation;

    if pos.x < 0.0 && current_room.grid_x > 0 {
        room_change_events.send(RoomChangeEvent {
            new_grid_x: current_room.grid_x - 1,
            new_grid_y: current_room.grid_y,
        });
    } else if pos.x > ROOM_WIDTH && current_room.grid_x < GRID_COLS - 1 {
        room_change_events.send(RoomChangeEvent {
            new_grid_x: current_room.grid_x + 1,
            new_grid_y: current_room.grid_y,
        });
    } else if pos.y > 0.0 && current_room.grid_y > 0 {
        room_change_events.send(RoomChangeEvent {
            new_grid_x: current_room.grid_x,
            new_grid_y: current_room.grid_y - 1,
        });
    } else if pos.y < -ROOM_HEIGHT && current_room.grid_y < GRID_ROWS - 1 {
        room_change_events.send(RoomChangeEvent {
            new_grid_x: current_room.grid_x,
            new_grid_y: current_room.grid_y + 1,
        });
    }
}

pub fn handle_room_change(
    mut commands: Commands,
    mut room_change_events: EventReader<RoomChangeEvent>,
    mut current_room: ResMut<CurrentRoom>,
    room_db: Res<crate::room::data::RoomDb>,
    in_room_query: Query<Entity, With<InRoom>>,
    mut player_query: Query<&mut Transform, With<Player>>,
) {
    for event in room_change_events.read() {
        let old_x = current_room.grid_x;
        let old_y = current_room.grid_y;

        current_room.set(event.new_grid_x, event.new_grid_y);

        crate::room::spawn::despawn_room(&mut commands, &in_room_query);
        crate::room::spawn::spawn_room(&mut commands, &room_db, current_room.index);

        if let Ok(mut transform) = player_query.get_single_mut() {
            if event.new_grid_x > old_x {
                transform.translation.x = TILE_SIZE;
            } else if event.new_grid_x < old_x {
                transform.translation.x = ROOM_WIDTH - TILE_SIZE;
            } else if event.new_grid_y > old_y {
                transform.translation.y = -TILE_SIZE;
            } else if event.new_grid_y < old_y {
                transform.translation.y = -(ROOM_HEIGHT - TILE_SIZE);
            }
        }
    }
}
