use std::vec;
use std::collections::HashMap;

use crate::cfg::regfile_cfg::*;

pub struct ARF{
    regs: Vec<u64>,
    busy_table: HashMap<usize, bool>
}

impl ARF{
    pub fn new()->Self{
        ARF { 
            regs: vec![0; APF_SIZE],
            busy_table:{
                let mut tmp = HashMap::<usize, bool>::new();
                for i in 0..APF_SIZE{
                    tmp.insert(i, false);
                }
                tmp
            }
        }
    }
    pub fn get(&self, rd: u8) -> u64{
        if rd == 0{
            0
        }
        else{
            self.regs.get(rd as usize).unwrap().clone()
        }
    }

    pub fn set(&mut self, rd:u8, data:u64){
        if rd != 0{
            self.regs[rd as usize] = data;
        }
    }

    pub fn get_busy(&self, rd: u8) -> bool{
        if rd != 0{
            self.busy_table.get(&(rd as usize)).unwrap().clone()
        }
        else{
            false
        }
    }
    pub fn set_busy(&mut self, rd:u8, busy:bool){
        if rd == 0{ return;}
        let tmp = self.busy_table.get_mut(&(rd as usize)).unwrap();
        *tmp = busy;
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
    regs:Vec<u64>,
    busy_table: HashMap<usize, bool>
}

impl CSRF{
    pub fn new()->Self{
        CSRF { 
            regs: vec![0; CSRF_SIZE],
            busy_table:{
                let mut tmp = HashMap::<usize, bool>::new();
                for i in 0..CSRF_SIZE{
                    tmp.insert(i, false);
                }
                tmp
            }
        }
    }
    pub fn get(&self, rd: u16) -> u64{
        self.regs.get(rd as usize).unwrap().clone()
    }

    pub fn set(&mut self, rd:u16, data:u64){
        self.regs[rd as usize] = data;
    }

    pub fn get_busy(&self, rd: u16) -> bool{
        self.busy_table.get(&(rd as usize)).unwrap().clone()
    }
    pub fn set_busy(&mut self, rd:u16, busy:bool){
        let tmp = self.busy_table.get_mut(&(rd as usize)).unwrap();
        *tmp = busy;
    }
}
