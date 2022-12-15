use super::core_cfg::*;

pub const BPU_ENABLE: bool = true;

pub const BTB_WIDTH:usize = 3;
pub const BTB_PC_WIDTH:usize = VIRTUAL_ADDR_WIDTH;
pub const BTB_PC_LOW:usize = 0;

pub const GSHARE_HISTORY_WIDTH:usize = 3;
pub const GSHARE_PC_WIDTH: usize =0;
pub const GSHARE_PC_LOW:usize = 0;
pub const GSHARE_PC_DO_HASH: bool = false;
