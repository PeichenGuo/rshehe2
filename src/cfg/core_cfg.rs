pub const XLEN: usize = 64;
pub const VIRTUAL_ADDR_WIDTH: usize = 39;
pub const PHYSICAL_ADDR_WIDTH: usize = 56;

pub const RV32I: u8 = 0b1;
pub const RV32E: u8 = 0b10;
pub const RV64I: u8 = 0b100;
pub const RV128I: u8 = 0b1000;

pub const RISCVM: u16 = 0b1;
pub const RISCVA: u16 = 0b10;
// pub const RISCVA: u16 = 0b100;
pub const RISCVF: u16 = 0b1000;
pub const RISCVD: u16 = 0b1_0000;
pub const RISCVQ: u16 = 0b10_0000;
pub const RISCVL: u16 = 0b100_0000;
pub const RISCVC: u16 = 0b1000_0000;
pub const RISCVB: u16 = 0b1_0000_0000;
pub const RISCVJ: u16 = 0b10_0000_0000;
pub const RISCVT: u16 = 0b100_0000_0000;
pub const RISCVV: u16 = 0b1000_0000_0000;
pub const RISCVN: u16 = 0b1_0000_0000_0000;

pub const EXCEPTION_UNIMPL_INSTR: u64 = 0x2;
pub const EXCEPTION_ENV_CALL_U: u64 =  0x8;
pub const EXCEPTION_ENV_CALL_S: u64 =  0x9;
// parameter  =  0xa; // NO EXCEPTION IN 10
pub const EXCEPTION_ENV_CALL_M: u64 =  0xb;
