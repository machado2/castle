use bevy::prelude::*;

#[derive(Component)]
pub struct Player;

#[derive(Component, Default)]
pub struct Velocity {
    pub x: f32,
    pub y: f32,
}

#[derive(Component, Default)]
pub struct PlayerState {
    pub on_ground: bool,
    pub on_ladder: bool,
    pub facing_right: bool,
}

#[derive(Resource, Default)]
pub struct PlayerInput {
    pub move_x: f32,
    pub move_y: f32,
    pub jump_pressed: bool,
    pub jump_held: bool,
}

#[derive(Resource, Default)]
pub struct Inventory {
    pub keys: u32,
    pub score: u32,
}
