use core::fmt;
use std::fmt::Display;

pub mod intsr_type;
pub mod decoded_instr;

#[derive(Default, Debug, PartialEq)]
pub struct Instr{
    pub pc_vld: bool,
    pub pc: u64,

    pub predicted_direction: bool, // 1 for branch, 0 for not branch
    pub predicted_pc: u64,

    pub raw_vld: bool,
    pub raw: u32,

    pub decoded_vld:bool,
    pub decoded: decoded_instr::DecodedInstr,

    pub reg_data_vld:bool,
    pub rs1_data:u64,
    pub rs2_data:u64,

    pub wb_vld:bool,
    pub wb_data:u64,

    pub csr_data: u64,
    pub csr_wb_data:u64, 

    pub predict_fail:bool,

    pub branch_vld:bool,
    pub branch_direction: bool,
    pub branch_pc:u64,

    pub exception_vld:bool,
    pub ecause:u64,
    pub exception_msg: String,

    pub exec:bool,
    pub done: bool
}

impl Instr {
    pub fn new(pc:u64) -> Self{
        Instr{
            pc_vld: true,
            pc: pc,

            predicted_direction: false, // 1 for branch, 0 for not branch
            predicted_pc: 0,

            raw_vld: false,
            raw: 0,

            decoded_vld:false,
            decoded: Default::default(),

            reg_data_vld:false,
            rs1_data:0,
            rs2_data:0,

            wb_vld:false,
            wb_data:0,

            csr_data:0,
            csr_wb_data:0,

            exception_vld:false,
            ecause:0,
            exception_msg:Default::default(),


            predict_fail:false,
            branch_vld:false, 
            branch_direction: false,
            branch_pc:0,

            exec:false,
            done: false
        }
    }

    pub fn fetch(&mut self, raw: u32){
        self.raw_vld = true;
        self.raw = raw;
    }

    pub fn decode(&mut self, decoded:decoded_instr::DecodedInstr ){
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

impl Display for Instr{
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result{
        write!(f, "\n\tpc:0x{:016x}\n\traw: {:08x}\n\tpredict direction: {} @ 0x{:016x}\n\tdecode:{:?}\n\trs1_data:0x{:016x} rs2_data:0x{:016x}\n\twb:{} wb_data:0x{:016x}\n\tpredict_fail:{}, branch_pc: 0x{:016x}\n\texex: {}, done:{}" , 
            self.pc, self.raw, self.predicted_direction, self.predicted_pc, self.decoded, self.rs1_data, self.rs2_data, self.wb_vld, self.wb_data,
            self.predict_fail, self.branch_pc,
            self.exec, self.done
        )
    }
}