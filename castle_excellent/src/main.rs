mod camera;
mod constants;
mod game_state;
mod physics;
mod player;
mod room;
mod tile;

use bevy::prelude::*;
use bevy::window::WindowResolution;

fn main() {
    App::new()
        .add_plugins(
            DefaultPlugins
                .set(WindowPlugin {
                    primary_window: Some(Window {
                        title: "Castle Excellent".into(),
                        resolution: WindowResolution::new(
                            constants::ROOM_WIDTH * constants::SCALE,
                            constants::ROOM_HEIGHT * constants::SCALE,
                        ),
                        resizable: false,
                        ..default()
                    }),
                    ..default()
                })
                .set(ImagePlugin::default_nearest()),
        )
        .insert_resource(ClearColor(Color::srgb(0.0, 0.0, 0.0)))
        .init_state::<game_state::GameState>()
        .add_plugins((
            camera::CameraPlugin,
            room::RoomPlugin,
            player::PlayerPlugin,
            physics::PhysicsPlugin,
        ))
        .add_systems(
            FixedUpdate,
            (
                player::input::read_input,
                player::movement::apply_player_movement,
                physics::collision::resolve_tile_collisions,
                room::transition::check_room_transition,
                room::transition::handle_room_change,
            )
                .chain(),
        )
        .add_systems(Update, (room_nav_debug, hud_system))
        .run();
}

fn find_spawn_in_room(room_db: &room::data::RoomDb, room_index: usize) -> (f32, f32) {
    let room = room_db.get(room_index);
    for row in (0..constants::ROOM_ROWS - 1).rev() {
        for col in 0..constants::ROOM_COLS {
            let here = room.tiles[row][col];
            let below = room.tiles[row + 1][col];
            if !tile::is_solid(here) && tile::is_solid(below) {
                return (
                    col as f32 * constants::TILE_SIZE + constants::TILE_SIZE / 2.0,
                    -(row as f32 * constants::TILE_SIZE + constants::TILE_SIZE / 2.0),
                );
            }
        }
    }
    (constants::ROOM_WIDTH / 2.0, -(constants::ROOM_HEIGHT / 2.0))
}

fn room_nav_debug(
    keyboard: Res<ButtonInput<KeyCode>>,
    mut current_room: ResMut<room::data::CurrentRoom>,
    mut commands: Commands,
    room_db: Res<room::data::RoomDb>,
    in_room_query: Query<Entity, With<room::spawn::InRoom>>,
    mut player_query: Query<&mut Transform, With<player::components::Player>>,
) {
    let mut new_x = current_room.grid_x as i32;
    let mut new_y = current_room.grid_y as i32;

    if keyboard.just_pressed(KeyCode::BracketRight) {
        new_x += 1;
    }
    if keyboard.just_pressed(KeyCode::BracketLeft) {
        new_x -= 1;
    }
    if keyboard.just_pressed(KeyCode::Minus) {
        new_y -= 1;
    }
    if keyboard.just_pressed(KeyCode::Equal) {
        new_y += 1;
    }

    new_x = new_x.clamp(0, constants::GRID_COLS as i32 - 1);
    new_y = new_y.clamp(0, constants::GRID_ROWS as i32 - 1);

    if new_x as usize != current_room.grid_x || new_y as usize != current_room.grid_y {
        current_room.set(new_x as usize, new_y as usize);
        room::spawn::despawn_room(&mut commands, &in_room_query);
        room::spawn::spawn_room(&mut commands, &room_db, current_room.index);

        if let Ok(mut transform) = player_query.get_single_mut() {
            let (sx, sy) = find_spawn_in_room(&room_db, current_room.index);
            transform.translation.x = sx;
            transform.translation.y = sy;
        }
    }
}

#[derive(Component)]
struct HudText;

fn hud_system(
    current_room: Res<room::data::CurrentRoom>,
    mut hud_query: Query<&mut Text, With<HudText>>,
    mut commands: Commands,
) {
    let text = format!(
        "Room {} ({}x{})",
        current_room.index, current_room.grid_x, current_room.grid_y
    );

    if let Ok(mut hud_text) = hud_query.get_single_mut() {
        **hud_text = text;
    } else {
        commands.spawn((
            Text::new(text),
            TextFont {
                font_size: 14.0,
                ..default()
            },
            TextColor(Color::srgb(1.0, 1.0, 1.0)),
            Node {
                position_type: PositionType::Absolute,
                top: Val::Px(4.0),
                left: Val::Px(4.0),
                ..default()
            },
            HudText,
        ));
    }
}
