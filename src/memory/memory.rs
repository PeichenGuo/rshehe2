// use std::env;
use std::vec;
use std::fs::File;
use std::io::{self, BufRead};
// use std::path::Path;
use hex;
use crate::interface::CtrlSignals;
use crate::cfg::memory_cfg::*;

pub struct Memory{
    data: Vec<u8> ,
    test_done: bool,
}

impl Memory {
    pub fn new() -> Self {
        let mem = Memory {
			data:  vec![0;MEMORY_SIZE as usize],
            test_done: false
		};
        
        mem
	}


    pub fn read_file(&mut self,filename: &str, base_addr: u64) {
        let base = (base_addr % MEMORY_SIZE as u64) as usize;
        let file = File::open(filename).expect("wrong filename");
        let buff = io::BufReader::new(file);
        let lines = buff.lines();
        let mut wpt = base;
        for line in lines{
            // println!("{}", line.unwrap());
            let l = line.unwrap();
            let mut tmpbuff = [0u8; LOAD_FILE_LINE_SIZE as usize]; 
            assert_eq!(hex::decode_to_slice(l, &mut tmpbuff as &mut[u8]), Ok(()));
            for i in (0..LOAD_FILE_LINE_SIZE as usize).rev() {
                self.data[wpt] = tmpbuff[i];
                wpt += 1;
            }
        }
    }

    pub fn lbu(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        self.data[addr] as u64
    }
    pub fn lb(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        let mut data : u64 = self.data[addr] as u64;
        if data & 0x80 == 0x80{
            data |= 0xffff_ffff_ffff_ff00;
        }
        data 
    }


    pub fn lhu(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        let mut data:u16 = 0;
        for i in 0..2{
            data += (self.data[addr + i] as u16) << (i * 8);
        }
        data as u64
    }

    pub fn lh(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        let mut data:u64 = 0;
        for i in 0..2{
            data += (self.data[addr + i] as u64) << (i * 8);
        }
        if data & 0x8000 == 0x8000{
            data |= 0xffff_ffff_ffff_0000;
        }
        data
    }

    pub fn lwu(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        let mut data:u32 = 0;
        for i in 0..4{
            data += (self.data[addr + i] as u32) << (i * 8);
        }
        data as u64
    }

    pub fn lw(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        let mut data:u64 = 0;
        for i in 0..4{
            data += (self.data[addr + i] as u64) << (i * 8);
        }
        if data & 0x8000_0000 == 0x8000_0000{
            data |= 0xffff_ffff_0000_0000;
        }
        data as u64
    }

    pub fn ld(&self, address: u64) -> u64{
        let addr = (address % MEMORY_SIZE as u64) as usize;
        let mut data:u64 = 0;
        for i in 0..8{
            data += (self.data[addr + i] as u64) << (i * 8);
        }
        data as u64
    }

    pub fn sb(&mut self, address: u64, data:u64){
        let addr = (address % MEMORY_SIZE as u64) as usize;
        self.data[addr] = data as u8;
    }

    pub fn sh(&mut self, address: u64, data:u64){
        let addr = (address % MEMORY_SIZE as u64) as usize;
        for i in 0..2{
            self.data[addr + i] = (data >> (8 * i)) as u8;
        }
    }

    pub fn sw(&mut self, address: u64, data:u64){
        let addr = (address % MEMORY_SIZE as u64) as usize;
        for i in 0..4{
            self.data[addr + i] = (data >> (8 * i)) as u8;
        }
    }

    pub fn sd(&mut self, address: u64, data:u64){
        let addr = (address % MEMORY_SIZE as u64) as usize;
        for i in 0..8{
            self.data[addr + i] = (data >> (8 * i)) as u8;
        }
    }

    pub fn test_done(&self) -> bool{
        self.test_done
    }
}
 
impl CtrlSignals for Memory {
    fn tik(&mut self){
        if(self.data[TOHOST_PADDR as usize % MEMORY_SIZE as usize] != 0x1) && (self.data[TOHOST_PADDR as usize % MEMORY_SIZE as usize] != 0x0){
            panic!("writr tohost fail: {}", self.data[TOHOST_PADDR as usize % MEMORY_SIZE as usize]);
        }
        else{
            self.test_done = true;
        }
    }
    fn rst(&mut self, _rst:bool){

    }
    fn flush(&mut self, _rst:bool){

    }
}

#[cfg(test)]
mod test {
    use crate::memory::memory::Memory;
    #[test]
    fn basic_load_on_add_hex(){
        let mut mem = Memory::new();
        mem.read_file("./isa/build/hex/rv64ui/add.hex", 0);

        assert_eq!(mem.lbu(0x0), 0x6fu64);
        assert_eq!(mem.lbu(0x1), 0x0u64);
        assert_eq!(mem.lbu(0x2), 0xc0u64);
        assert_eq!(mem.lb(0x2), 0xffff_ffff_ffff_ffc0);

        assert_eq!(mem.lhu(0x4), 0x2f73);
        assert_eq!(mem.lhu(0x6), 0x3420);

        assert_eq!(mem.lwu(0x0), 0x05c0006f);
        assert_eq!(mem.lwu(0x4), 0x34202f73);

        assert_eq!(mem.ld(0x0), 0x34202f7305c0006f);

        mem.sb(0, 0x2b);
        assert_eq!(mem.lb(0x0), 0x2b);

        mem.sh(0, 0xaf2b);
        assert_eq!(mem.lh(0x0), 0xffff_ffff_ffff_af2b);

        mem.sw(0, 0xdeadbeaf);
        assert_eq!(mem.lw(0x0), 0xffff_ffff_dead_beaf);

        mem.sd(0, 0xdeadbeaf_deadbeaf);
        assert_eq!(mem.ld(0x0), 0xdeadbeaf_deadbeaf);
    }
}