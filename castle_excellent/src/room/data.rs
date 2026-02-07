use bevy::prelude::*;
use serde::Deserialize;

#[derive(Deserialize, Clone, Debug)]
pub struct RoomObject {
    pub x: u8,
    pub y: u8,
    pub code: u8,
}

#[derive(Deserialize, Clone, Debug)]
pub struct RoomDef {
    pub id: usize,
    pub group: usize,
    pub room_idx: usize,
    pub tiles: Vec<Vec<u8>>,
    pub objects: Vec<RoomObject>,
}

#[derive(Deserialize)]
struct RoomsFile {
    rooms: Vec<RoomDef>,
}

#[derive(Resource)]
pub struct RoomDb {
    pub rooms: Vec<RoomDef>,
}

impl RoomDb {
    pub fn load() -> Self {
        let json_str = include_str!("../../assets/rooms.json");
        let file: RoomsFile = serde_json::from_str(json_str).expect("Failed to parse rooms.json");
        RoomDb { rooms: file.rooms }
    }

    pub fn get(&self, index: usize) -> &RoomDef {
        &self.rooms[index]
    }

    pub fn tile_at(&self, room_index: usize, row: usize, col: usize) -> u8 {
        if row < 20 && col < 30 {
            self.rooms[room_index].tiles[row][col]
        } else {
            0
        }
    }
}

#[derive(Resource)]
pub struct CurrentRoom {
    pub index: usize,
    pub grid_x: usize,
    pub grid_y: usize,
}

impl Default for CurrentRoom {
    fn default() -> Self {
        CurrentRoom {
            index: 0,
            grid_x: 0,
            grid_y: 0,
        }
    }
}

impl CurrentRoom {
    pub fn set(&mut self, grid_x: usize, grid_y: usize) {
        self.grid_x = grid_x;
        self.grid_y = grid_y;
        self.index = grid_y * 10 + grid_x;
    }
}
