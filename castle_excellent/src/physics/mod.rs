pub mod collision;

use bevy::prelude::*;

pub struct PhysicsPlugin;

impl Plugin for PhysicsPlugin {
    fn build(&self, _app: &mut App) {
        // Systems are registered in main.rs for proper ordering
    }
}
