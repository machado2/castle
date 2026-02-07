pub mod data;
pub mod spawn;
pub mod transition;

use bevy::prelude::*;
use crate::game_state::GameState;

pub struct RoomPlugin;

impl Plugin for RoomPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(data::RoomDb::load())
            .init_resource::<data::CurrentRoom>()
            .add_event::<transition::RoomChangeEvent>()
            .add_systems(OnEnter(GameState::Playing), setup_initial_room);
    }
}

fn setup_initial_room(
    mut commands: Commands,
    room_db: Res<data::RoomDb>,
    current_room: Res<data::CurrentRoom>,
) {
    spawn::spawn_room(&mut commands, &room_db, current_room.index);
}
