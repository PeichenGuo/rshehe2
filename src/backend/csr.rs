use crate::buffers::fifo::{DelayFIFO};
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::{InstrOpcode::{*}};

pub struct CSR{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl CSR {
    pub fn new(delay: u16) -> Self{
        CSR { 
            output: DelayFIFO::new(1, vec![delay]),
        }
    }

    fn csr_val(& self, instr: &Instr, csr: u64) -> u64{
        match instr.decoded.opcode_type{
            CSRRW => instr.rs1_data,
            CSRRS => instr.rs1_data | csr,
            CSRRC => instr.rs1_data & csr,
            CSRRWI => instr.decoded.zimm as u64,
            CSRRSI => instr.decoded.zimm as u64 | csr,
            CSRRCI => instr.decoded.zimm as u64 & csr,
            _ => panic!("invalid opcode type for csr: {:?}", instr.decoded.opcode_type)
        }
    }
}

impl Interface for CSR{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        // if req.0{
        //     println!("csr req in: {:016x}, exception vld:{}", req.1.borrow().pc, req.1.borrow().exception_vld);
        // }
        if req.1.borrow().exception_vld{
            self.output.req_i((true, req.1.clone()));
            return;
        }
        if self.output.rdy_o() && req.0 {
            if req.1.borrow().decoded.is_csr{ // csr
                let instr = req.1.clone();
                let old_csr_val = instr.borrow().csr_data;
                let csr_data = self.csr_val(&instr.borrow(), old_csr_val);
                let wb_vld = instr.borrow().decoded.csr_re;
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.wb_vld = wb_vld;
                tmp.wb_data = old_csr_val;
                tmp.csr_wb_data = csr_data;
                tmp.exec = true;
                drop(tmp);
            }
            
            self.output.req_i((true, req.1.clone()));
        }
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        // self.output.display();
        // if self.output.resp_o().0{
        //     println!("csr resp out : {:016x}", self.output.resp_o().1.borrow().pc);
        // }   
        
        self.output.resp_o().clone()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for CSR{
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
    use crate::backend::csr::CSR;
    use crate::instr::Instr;
    use crate::interface::{Interface, CtrlSignals};
    use crate::instr::intsr_type::InstrOpcode::*;
    use crate::utils::ref_cell_borrow_mut;
    use std::sync::Arc;
    use std::mem::drop;

    #[test]
    fn basic_csr_test(){
        let mut csr = CSR::new(1);
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        // csrci
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_csr = true;
        tmp.decoded.opcode_type = CSRRWI;
        tmp.decoded.zimm = 0x0f;
        tmp.decoded.rd = 1;
        tmp.decoded.rs1 = 1;
        tmp.decoded.csr_re = true;
        tmp.decoded.csr_we = true;
        tmp.csr_data = 0xf0;
        drop(tmp);

        csr.req_i((true, instr.clone()));
        csr.tik();
        assert_eq!(csr.resp_o().0, true);
        assert_eq!(csr.resp_o().1.borrow().wb_vld, true);
        assert_eq!(csr.resp_o().1.borrow().wb_data, 0xf0);
        csr.rdy_i(true);

        // // ecall
        // // println!("1");
        // let mut tmp = ref_cell_borrow_mut(&instr);
        // tmp.decoded.is_csr = false;
        // tmp.decoded.csr = 1;
        // tmp.decoded.is_syscall = true;
        // tmp.wb_vld = false; // reset

        // tmp.decoded.opcode_type = ECALL;
        // tmp.decoded.zimm = 0x0f;
        // drop(tmp);

        // // println!("1");
        // csr.req_i((true, instr.clone()));
        // // println!("2");
        // csr.tik();
        // assert_eq!(csr.resp_o().0, true);
        // assert_eq!(csr.resp_o().1.borrow().wb_vld, false);
        // // assert_eq!(csr.resp_o().1.borrow().wb_data, 0xf0);
        // assert_eq!(csr.resp_o().1.borrow().predict_fail, true);
        // assert_eq!(csr.resp_o().1.borrow().branch_pc, 0x8000_1000);
        // csr.rdy_i(true);
    }
}