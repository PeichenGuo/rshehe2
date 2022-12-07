use crate::instr::InstrType::*;
use crate::instr::DecodedInstr::*;

pub mod InstrType;
pub mod DecodedInstr;

pub struct Instr{
    pc_vld: bool,
    pc: u32,

    raw_vld: bool,
    raw: u32,

    decoded_vld:bool,
    decoded: Option<DecodedInstr::DecodedInstr>,

    reg_data_vld:bool,
    rs1_data:u64,
    rs2_data:u64,

    wb_vld:bool,
    wb_data:u64,

    exception_vld:bool,
    ecause:u64,

    done: bool
}

impl Instr {
    pub fn new(pc:u32) -> Self{
        Instr{
            pc_vld: true,
            pc: pc,

            raw_vld: false,
            raw: 0,

            decoded_vld:false,
            decoded: None,

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
        self.decoded = Some(decoded);
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