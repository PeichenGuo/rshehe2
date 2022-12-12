use crate::buffers::delay_fifo::{DelayFIFO};
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::InstrOpcode::*;
use crate::cfg::regfile_cfg::APF_MAPPING;
pub struct MUL{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl MUL {
    pub fn new(delay: u16) -> Self{
        MUL { 
            output: DelayFIFO::new(1, vec![delay])
        }
    }

    fn calc(& self, instr: &Instr) -> u64{
        let rs1 = instr.rs1_data;
        let rs2 = instr.rs2_data;
        match instr.decoded.opcode_type{
            MUL => (rs1 as i64 as u128 * rs2 as i64 as u128) as u64,
            MULH => ((rs1 as i64 as u128).wrapping_mul(rs1 as i64 as u128) >> 64) as u64,
            MULHSU => ((rs1 as i64 as u128).wrapping_mul(rs2 as u128) >> 64) as u64,
            MULHU => ((rs1 as u128 * rs2 as u128) >> 64) as u64,
            DIV => ((rs1 as i64) / (rs2 as i64)) as u64,
            DIVU => rs1 / rs2,
            REM => ((rs1 as i64) % (rs2 as i64)) as u64,
            REMU => rs1 % rs2,
            _ => panic!("invalid opcode type for mul: {:?}", instr.decoded.opcode_type)
        }
        
    }
}

impl Interface for MUL{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        // if req.0{
        //     println!("mul req in: {:016x}, mul rdy:{}", req.1.borrow().pc, self.rdy_o());
        // }
        if self.rdy_o() && req.0 && req.1.borrow().decoded.is_mul{ //hsk
            if !req.1.borrow().exception_vld{
                let instr = req.1.clone();
                let val = self.calc(&instr.borrow());
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.wb_vld = true;
                tmp.wb_data = val;
                tmp.exec = true;
            }
            self.output.req_i((true, req.1.clone()));
        }
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        if self.output.resp_o().0{
            println!("mul resp {:016x}: 0x{:016x} -> {:?}", self.output.resp_o().1.borrow().pc, self.output.resp_o().1.borrow().wb_data, APF_MAPPING[self.output.resp_o().1.borrow().decoded.rd as usize])
        }
        self.output.resp_o().clone()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for MUL{
    fn tik(&mut self){
        self.output.tik();
    }
    fn rst(&mut self, rst:bool){
        self.output.rst(rst);
    }
    fn flush(&mut self, rst:bool){
        self.output.flush(rst);
    }
}

#[cfg(test)]
mod test{
    // use std::cell::RefCell;
    // use crate::backend::mul::MUL;
    // use crate::instr::Instr;
    // use crate::interface::{Interface, CtrlSignals};
    // use crate::instr::intsr_type::InstrOpcode::*;
    // use crate::utils::ref_cell_borrow_mut;
    // use std::sync::Arc;
    // use std::mem::drop;

    // #[test]
    // fn basic_mul_test(){
    //     let mut mul = MUL::new(1);
    //     let instr = Arc::new(RefCell::new(Instr::new(0x0)));
        
    //     // add
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.is_alu = true;
    //     tmp.decoded.opcode_type = ADD;
    //     tmp.rs1_data = 0x1;
    //     tmp.rs2_data = 0x2;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0x1 + 0x2);
    //     mul.rdy_i(true);

    //     // addi without sext
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = ADDI;
    //     tmp.rs1_data = 0x1;
    //     tmp.decoded.immi = 0x02;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0x1 + 0x2);
    //     mul.rdy_i(true);

    //     // addi with sext
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = ADDI;
    //     tmp.rs1_data = 0x1;
    //     tmp.decoded.immi = 0x800;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0xffff_ffff_ffff_f801);
    //     mul.rdy_i(true);

    //     // addw 
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = ADDW;
    //     tmp.rs1_data = 0x1;
    //     tmp.rs2_data = 0x1000_0000_0000_0002;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0x3);
    //     mul.rdy_i(true);

    //     // SLLIW 
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = SLLIW;
    //     tmp.rs1_data = 0x8000_0001;
    //     tmp.decoded.shamt = 0x1;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0x02);
    //     mul.rdy_i(true);

    //     // SLTI
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = SLTI;
    //     tmp.rs1_data = 0x1;
    //     tmp.decoded.immi = 0x2;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 1);
    //     mul.rdy_i(true);

    //     // SLTI
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = SLTI;
    //     tmp.rs1_data = 0x1;
    //     tmp.decoded.immi = 0x802;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0);
    //     mul.rdy_i(true);

    //     // SRA
    //     let mut tmp = ref_cell_borrow_mut(&instr);
    //     tmp.decoded.opcode_type = SRA;
    //     tmp.rs1_data = 0x8000_0000_0000_0000;
    //     tmp.rs2_data = 1;
    //     drop(tmp);

    //     mul.req_i((true, instr.clone()));
    //     mul.tik();
    //     assert_eq!(mul.resp_o().0, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
    //     assert_eq!(mul.resp_o().1.borrow().wb_data, 0xc000_0000_0000_0000);
    //     mul.rdy_i(true);
    // }
}