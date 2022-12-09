pub const A_CONST:u32 = 1;

pub const MEMORY_WIDTH:u32 = 30; // 4 M
pub const MEMORY_SIZE:u32 = 1 << MEMORY_WIDTH;

pub const LOAD_FILE_LINE_SIZE: u32 = 128 / 8;

pub const ELF_START_PADDR:u64 = 0x8000_0000;
pub const TOHOST_PADDR:u64 = 0x8000_1000;