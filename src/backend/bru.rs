use crate::buffers::delay_fifo::{DelayFIFO};
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::InstrOpcode::*;

pub struct BRU{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl BRU {
    pub fn new(delay: u16) -> Self{
        BRU { 
            output: DelayFIFO::new(1, vec![delay]),
        }
    }

    fn calc(& self, instr: &Instr) -> (bool, u64){
        let branch_pc = instr.pc + sext(instr.decoded.immb as u64, 12);
        match instr.decoded.opcode_type{
            JALR => (true, sext(instr.decoded.immi as u64, 11) + instr.rs1_data),
            JAL => (true, instr.pc + sext(instr.decoded.immj as u64, 20)),
            BEQ => (instr.rs1_data == instr.rs2_data, branch_pc),
            BNE => (instr.rs1_data != instr.rs2_data, branch_pc),
            BLT => (signed_less_than(instr.rs1_data, instr.rs2_data), branch_pc),
            BGE => (!signed_less_than(instr.rs1_data, instr.rs2_data), branch_pc),
            BLTU => (instr.rs1_data < instr.rs2_data, branch_pc),
            BGEU => (instr.rs1_data >=instr.rs2_data, branch_pc),
            _ => panic!("invalid opcode type for BRU: {:?}", instr.decoded.opcode_type)
        }
    }

    fn wb(& self, instr: &Instr) -> (bool, u64){
        match instr.decoded.opcode_type{
            JALR | JAL => (true, instr.pc + 4),
            _ => (false, 0)
        }
    }
}

impl Interface for BRU{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        if self.rdy_o() && req.0 && req.1.borrow().decoded.is_branch{ //hsk
            println!("branch");
            if !req.1.borrow().exception_vld{
                let instr = req.1.clone();
                let (branch, val) = self.calc(&instr.borrow());
                let final_bru_pc:u64 = if branch {val} else {instr.borrow().pc + 4};
                println!("branch {} val {:08x}", branch, val);
                let final_predict_pc:u64 = if instr.borrow().predicted_direction {instr.borrow().predicted_pc} 
                                            else {instr.borrow().pc + 4};
                // println!("predicted_direction {} predicted_pc {:08x}", instr.borrow().predicted_direction, instr.borrow().predicted_pc);
                // println!("final_bru_pc 0x{:08x} final_predict_pc {:08x}\n", final_bru_pc, final_predict_pc);
                let predict_succ = final_bru_pc == final_predict_pc;
                let (wb_vld, wb_data) = self.wb(&instr.borrow());
                
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.exec = true;
                if wb_vld{
                    tmp.wb_vld = true;
                    tmp.wb_data = wb_data;
                }
                if !predict_succ{
                    tmp.predict_fail = true;
                    tmp.branch_pc = final_bru_pc;
                }
            }
            self.output.req_i((true, req.1.clone()));
        }
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        self.output.resp_o().clone()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for BRU{
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
    use std::cell::RefCell;
    use crate::backend::bru::BRU;
    use crate::instr::Instr;
    use crate::interface::{Interface, CtrlSignals};
    use crate::instr::intsr_type::InstrOpcode::*;
    use crate::utils::ref_cell_borrow_mut;
    use std::sync::Arc;
    use std::mem::drop;

    #[test]
    fn basic_bru_test(){
        let mut bru = BRU::new(1);
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        
        // beq succ predict succ
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_branch = true;
        tmp.predicted_direction = true;
        tmp.predicted_pc = 0x8000_0010;

        tmp.decoded.opcode_type = BEQ;
        tmp.decoded.immb = 0x10;
        tmp.rs1_data = 0x1;
        tmp.rs2_data = 0x1;

        tmp.wb_vld = false;
        // tmp.rs2_data = 0x2;
        drop(tmp);

        bru.req_i((true, instr.clone()));
        bru.tik();
        assert_eq!(bru.resp_o().0, true);
        assert_eq!(bru.resp_o().1.borrow().wb_vld, false);
        assert_eq!(bru.resp_o().1.borrow().predict_fail, false);
        bru.rdy_i(true);



        // beq fail predict success
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_branch = true;
        tmp.predicted_direction = false;
        tmp.predicted_pc = 0x8000_0010;

        tmp.decoded.opcode_type = BEQ;
        tmp.decoded.immb = 0x10;
        tmp.rs1_data = 0x1;
        tmp.rs2_data = 0x2;

        tmp.wb_vld = false;
        // tmp.rs2_data = 0x2;
        drop(tmp);

        bru.req_i((true, instr.clone()));
        bru.tik();
        assert_eq!(bru.resp_o().0, true);
        assert_eq!(bru.resp_o().1.borrow().wb_vld, false);
        assert_eq!(bru.resp_o().1.borrow().predict_fail, false);
        bru.rdy_i(true);



        // beq succ predict success
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_branch = true;
        tmp.predicted_direction = false;
        tmp.predicted_pc = 0x8000_0010;

        tmp.decoded.opcode_type = BEQ;
        tmp.decoded.immb = 0x10;
        tmp.rs1_data = 0x1;
        tmp.rs2_data = 0x1;

        tmp.wb_vld = false;
        // tmp.rs2_data = 0x2;
        drop(tmp);

        bru.req_i((true, instr.clone()));
        bru.tik();
        assert_eq!(bru.resp_o().0, true);
        assert_eq!(bru.resp_o().1.borrow().wb_vld, false);
        assert_eq!(bru.resp_o().1.borrow().predict_fail, true);
        assert_eq!(bru.resp_o().1.borrow().branch_pc, 0x8000_0010);
        bru.rdy_i(true);



        // jalr predict success
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_branch = true;
        tmp.predicted_direction = true;
        tmp.predicted_pc = 0x8000_0010;

        tmp.decoded.opcode_type = JALR;
        tmp.decoded.immb = 0x10;
        tmp.decoded.immi = 0x10;
        tmp.rs1_data = 0x8000_0000;
        tmp.rs2_data = 0x1;

        tmp.wb_vld = false;
        tmp.predict_fail = false;
        tmp.branch_pc = 0;
        // tmp.rs2_data = 0x2;
        drop(tmp);

        bru.req_i((true, instr.clone()));
        bru.tik();
        assert_eq!(bru.resp_o().0, true);
        assert_eq!(bru.resp_o().1.borrow().wb_vld, true);
        assert_eq!(bru.resp_o().1.borrow().wb_data, 0x8000_0004);
        assert_eq!(bru.resp_o().1.borrow().predict_fail, false);
        // assert_eq!(bru.branch_o().1, 0x8000_0010);
        bru.rdy_i(true);

        // jal predict fail
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_branch = true;
        tmp.predicted_direction = false;
        tmp.predicted_pc = 0x8000_0010;

        tmp.decoded.opcode_type = JALR;
        tmp.decoded.immb = 0x10;
        tmp.decoded.immj = 0x10;
        tmp.rs1_data = 0x8000_0000;
        tmp.rs2_data = 0x1;

        tmp.wb_vld = false;
        tmp.predict_fail = false;
        tmp.branch_pc = 0;
        // tmp.rs2_data = 0x2;
        drop(tmp);

        bru.req_i((true, instr.clone()));
        bru.tik();
        assert_eq!(bru.resp_o().0, true);
        assert_eq!(bru.resp_o().1.borrow().wb_vld, true);
        assert_eq!(bru.resp_o().1.borrow().wb_data, 0x8000_0004);
        assert_eq!(bru.resp_o().1.borrow().predict_fail, true);
        assert_eq!(bru.resp_o().1.borrow().branch_pc, 0x8000_0010);
        // assert_eq!(bru.branch_o().1, 0x8000_0010);
        bru.rdy_i(true);
    }
}