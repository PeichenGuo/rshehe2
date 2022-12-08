use crate::instr::InstrType::*;
use crate::instr::DecodedInstr::*;

pub mod InstrType;
pub mod DecodedInstr;

#[derive(Default, Debug, PartialEq)]
pub struct Instr{
    pub pc_vld: bool,
    pub pc: u64,

    pub raw_vld: bool,
    pub raw: u32,

    pub decoded_vld:bool,
    pub decoded: DecodedInstr::DecodedInstr,

    pub reg_data_vld:bool,
    pub rs1_data:u64,
    pub rs2_data:u64,

    pub wb_vld:bool,
    pub wb_data:u64,

    pub exception_vld:bool,
    pub ecause:u64,

    pub done: bool
}

impl Instr {
    pub fn new(pc:u64) -> Self{
        Instr{
            pc_vld: true,
            pc: pc,

            raw_vld: false,
            raw: 0,

            decoded_vld:false,
            decoded: Default::default(),

            reg_data_vld:false,
            rs1_data:0,
            rs2_data:0,

            wb_vld:false,
            wb_data:0,

            exception_vld:false,
            ecause:0,

            done: false
        }
    }

    pub fn fetch(&mut self, raw: u32){
        self.raw_vld = true;
        self.raw = raw;
    }

    pub fn decode(&mut self, decoded:DecodedInstr::DecodedInstr ){
        self.decoded_vld = true;
        self.decoded = decoded;
    }

    pub fn dispatch(&mut self, rs1: u64, rs2: u64){
        self.reg_data_vld = true;
        self.rs1_data = rs1;
        self.rs2_data = rs2;
    }

    pub fn exec_done(&mut self, wb_vld: bool, wb_data: u64){
        self.wb_vld = wb_vld;
        self.wb_data = wb_data;
    }

    pub fn exception(&mut self, ecause: u64){
        self.exception_vld = true;
        self.ecause = ecause;
    }

    pub fn finish(&mut self){
        self.done = true;
    }
}