use crate::buffers::delay_fifo::{DelayFIFO};
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::{InstrOpcode::{*, self}, InstrType};

pub struct CSR{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl CSR {
    pub fn new() -> Self{
        CSR { 
            output: DelayFIFO::new(1, vec![1]),
        }
    }

    fn csr_val(& self, instr: &Instr) -> u64{
        match instr.decoded.opcode_type{
            CSRRW => instr.rs1_data,
            CSRRS => instr.rs1_data | instr.csr_data,
            CSRRC => instr.rs1_data & instr.csr_data,
            CSRRWI => instr.decoded.zimm as u64,
            CSRRSI => instr.decoded.zimm as u64 | instr.csr_data,
            CSRRCI => instr.decoded.zimm as u64 & instr.csr_data,
            _ => panic!("invalid opcode type for csr: {:?}", instr.decoded.opcode_type)
        }
    }
}

impl Interface for CSR{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        if req.0{
            println!("csr req in: {:08x}, csr rdy:{}", req.1.borrow().pc, self.rdy_o());
        }
        if self.rdy_o() && req.0 && (req.1.borrow().decoded.is_csr){ //hsk
            let instr = req.1.clone();
            let old_csr_val = instr.borrow().csr_data.clone();
            let csr_val = self.csr_val(&instr.borrow());
            let mut tmp = ref_cell_borrow_mut(&instr);
            tmp.wb_vld = true;
            tmp.wb_data = old_csr_val;
            tmp.csr_wb_vld = true;
            tmp.csr_wb_data = csr_val;
            tmp.exec = true;
            self.output.req_i((true, req.1.clone()));
        }
        else if self.rdy_o() && req.0 && (req.1.borrow().decoded.is_syscall){
            // FIXME: ebreak == ecause, wrong 
            // FIXME: 徐志轩说的什么向量模式也没有实现
            match req.1.borrow().decoded.opcode_type {
                InstrOpcode::EBREAK | InstrOpcode::ECALL =>{
                    let instr = req.1.clone();
                    let mut tmp = ref_cell_borrow_mut(&instr);
                    tmp.predict_fail = true;
                    tmp.branch_pc = tmp.csr_data; // mtvec 
                    tmp.csr_wb_vld = true;
                    tmp.csr_wb_data = tmp.pc + 4; // mepc
                    tmp.exec = true;
                    self.output.req_i((true, req.1.clone()));
                },
                InstrOpcode::MRET => {

                },
                _ =>{
                    panic!("illegal syscall opcode in csr");
                }
            }   
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
        let mut csr = CSR::new();
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        
        // csrci
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_csr = true;
        tmp.decoded.opcode_type = CSRRCI;
        tmp.decoded.zimm = 0x0f;
        tmp.csr_data = 0xf0;
        drop(tmp);

        csr.req_i((true, instr.clone()));
        csr.tik();
        assert_eq!(csr.resp_o().0, true);
        assert_eq!(csr.resp_o().1.borrow().wb_vld, true);
        assert_eq!(csr.resp_o().1.borrow().wb_data, 0xf0);
        assert_eq!(csr.resp_o().1.borrow().csr_wb_vld, true);
        assert_eq!(csr.resp_o().1.borrow().csr_wb_data, 0);
        csr.rdy_i(true);

        // ecall
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_csr = false;
        tmp.decoded.is_syscall = true;
        tmp.wb_vld = false; // reset

        tmp.decoded.opcode_type = ECALL;
        tmp.decoded.zimm = 0x0f;
        tmp.csr_data = 0x8000_1000;
        drop(tmp);

        csr.req_i((true, instr.clone()));
        csr.tik();
        assert_eq!(csr.resp_o().0, true);
        assert_eq!(csr.resp_o().1.borrow().wb_vld, false);
        // assert_eq!(csr.resp_o().1.borrow().wb_data, 0xf0);
        assert_eq!(csr.resp_o().1.borrow().csr_wb_vld, true);
        assert_eq!(csr.resp_o().1.borrow().csr_wb_data, 0x8000_0004);
        assert_eq!(csr.resp_o().1.borrow().predict_fail, true);
        assert_eq!(csr.resp_o().1.borrow().branch_pc, 0x8000_1000);
        csr.rdy_i(true);
    }
}