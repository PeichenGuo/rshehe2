
// use crate::cfg::memory_cfg::*;
// use crate::cfg::core_cfg;

pub mod memory;
pub mod cfg;
pub mod instr;
pub mod interface;
pub mod buffers;
pub mod frontend;
pub mod backend;
pub mod utils;

#[macro_use]
extern crate lazy_static;

use crate::memory::memory::Memory;
fn main() {
    println!("Hello, world!");

    let mut mem = Memory::new();
    mem.read_file("./isa_tests/add.hex", 0);
    // println!("mem[0] = {:02x}", &mem.lbu(0));
    // println!("mem[1] = {:02x}", &mem.lbu(1));
    // println!("mem[2] = {:02x}", &mem.lbu(2));
}
