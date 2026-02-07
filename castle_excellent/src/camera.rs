use bevy::prelude::*;
use crate::constants::*;

pub struct CameraPlugin;

impl Plugin for CameraPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Startup, setup_camera);
    }
}

fn setup_camera(mut commands: Commands) {
    commands.spawn((
        Camera2d,
        Transform::from_xyz(ROOM_WIDTH / 2.0, -ROOM_HEIGHT / 2.0, 999.9),
        OrthographicProjection {
            scaling_mode: bevy::render::camera::ScalingMode::Fixed {
                width: ROOM_WIDTH,
                height: ROOM_HEIGHT,
            },
            ..OrthographicProjection::default_2d()
        },
    ));
}
