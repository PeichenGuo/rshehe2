use std::vec;

use crate::cfg::regfile_cfg::*;

pub struct ARF{
    regs: Vec<u64>
}

impl ARF{
    pub fn new()->Self{
        ARF { 
            regs: vec![0; APF_SIZE],
        }
    }
    pub fn get(&self, rd: u8) -> u64{
        self.regs.get(rd as usize).unwrap().clone()
    }

    pub fn set(&mut self, rd:u8, data:u64){
        self.regs[rd as usize] = data;
    }
}

pub struct CSRF{
    // mtvec: u64,
    // mepc: u64,
    // mcasue: u64,
    // mie: u64, // Machine Interrupt Enable 它指出处理器目前能处理和必须忽略的中断。
    // mip: u64, // Machine Interrupt Pending 它列出目前正准备处理的中断
    // mtval: u64, // Machine Trap Value它保存了陷入(trap)的附加信息:地址例外中出错的地址、发生非法指令例外的指令本身，对于其他异常，它的值为 0。
    // mscratch: u64,
    // mstatus: u64
    regs:Vec<u64>
}

impl CSRF{
    pub fn new()->Self{
        CSRF { 
            regs: vec![0; CSRF_SIZE],
        }
    }
    pub fn get(&self, rd: u8) -> u64{
        self.regs.get(rd as usize).unwrap().clone()
    }

    pub fn set(&mut self, rd:u8, data:u64){
        self.regs[rd as usize] = data;
    }
}
