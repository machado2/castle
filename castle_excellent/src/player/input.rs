use bevy::prelude::*;
use super::components::PlayerInput;

pub fn read_input(keyboard: Res<ButtonInput<KeyCode>>, mut input: ResMut<PlayerInput>) {
    input.move_x = 0.0;
    input.move_y = 0.0;

    if keyboard.pressed(KeyCode::ArrowLeft) || keyboard.pressed(KeyCode::KeyA) {
        input.move_x -= 1.0;
    }
    if keyboard.pressed(KeyCode::ArrowRight) || keyboard.pressed(KeyCode::KeyD) {
        input.move_x += 1.0;
    }
    if keyboard.pressed(KeyCode::ArrowUp) || keyboard.pressed(KeyCode::KeyW) {
        input.move_y += 1.0;
    }
    if keyboard.pressed(KeyCode::ArrowDown) || keyboard.pressed(KeyCode::KeyS) {
        input.move_y -= 1.0;
    }

    input.jump_pressed =
        keyboard.just_pressed(KeyCode::Space) || keyboard.just_pressed(KeyCode::KeyZ);
    input.jump_held = keyboard.pressed(KeyCode::Space) || keyboard.pressed(KeyCode::KeyZ);
}
