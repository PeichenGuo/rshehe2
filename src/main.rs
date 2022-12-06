
use crate::memory::memory_hello_world;
use crate::cfg::memory_cfg::*;
use crate::cfg::b;

pub mod memory;
pub mod cfg;

fn main() {
    println!("Hello, world!");
    memory_hello_world();
    println!("{}", A_CONST);
    println!("{}", b::B_CONST);

    let mut mem = memory::Memory::new();
    mem.read_file("./isa_tests/add.hex", 0);
    // println!("mem[0] = {:02x}", &mem.lbu(0));
    // println!("mem[1] = {:02x}", &mem.lbu(1));
    // println!("mem[2] = {:02x}", &mem.lbu(2));
}
