mod camera;
mod constants;
mod game_state;
mod physics;
mod player;
mod room;
mod tile;

use bevy::prelude::*;

fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .init_state::<game_state::GameState>()
        .run();
}
