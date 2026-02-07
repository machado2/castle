#[derive(Debug, Clone, Copy, Default, Eq, PartialEq, Hash, bevy::prelude::States)]
pub enum GameState {
    #[default]
    Playing,
}
