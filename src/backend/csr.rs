use crate::buffers::delay_fifo::{DelayFIFO};
use core::panic;
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::{InstrOpcode::{*, self}};
use crate::memory::regfiles::CSRF;
use crate::cfg::regfile_cfg::*;

pub struct CSR{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
    csrf: Arc<RefCell<CSRF>>
}

impl CSR {
    pub fn new(csrf: Arc<RefCell<CSRF>>, delay: u16) -> Self{
        CSR { 
            output: DelayFIFO::new(1, vec![delay]),
            csrf:csrf.clone()
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
                let (wb_vld, csr_wb_vld): (bool, bool) = match instr.borrow().decoded.opcode_type{
                    CSRRW | CSRRWI => (instr.borrow().decoded.rd != 0, true),
                    CSRRC | CSRRCI | CSRRS | CSRRSI => (true, instr.borrow().decoded.rs1 != 0),
                    _ => {
                        panic!("illegal opcode type {:?} for csr instr in csr", instr.borrow().decoded.opcode_type);
                    }
                };
                let old_csr_val = if wb_vld {self.csrf.borrow().get(req.1.borrow().decoded.csr)}else{0};
                let csr_data = self.csr_val(&instr.borrow(), old_csr_val);
                if csr_wb_vld {
                    println!("csrf write: 0x{:016x} @ {}", csr_data, instr.borrow().decoded.csr);
                    ref_cell_borrow_mut(&self.csrf).set(instr.borrow().decoded.csr as u16, csr_data);
                }
                if wb_vld{
                    println!("arf write: 0x{:016x} @ {}", old_csr_val, instr.borrow().decoded.rd);
                }
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.wb_vld = wb_vld;
                tmp.wb_data = old_csr_val;
                tmp.exec = true;
                drop(tmp);
            }
            else if self.output.rdy_o() && req.0 && (req.1.borrow().decoded.is_syscall){
                // FIXME: ebreak == ecause, wrong 
                // FIXME: 徐志轩说的什么向量模式也没有实现
                let opcode = req.1.borrow().decoded.opcode_type.clone();
                match opcode {
                    InstrOpcode::EBREAK | InstrOpcode::ECALL =>{
                        println!("ecall");
                        let instr = req.1.clone();
                        let final_predict_pc:u64 = if instr.borrow().predicted_direction {instr.borrow().predicted_pc} 
                                                else {instr.borrow().pc + 4};
                        let csr_val = self.csrf.borrow().get(CSR_MTVEC_ADDRESS as u16);
                        ref_cell_borrow_mut(&self.csrf).set(CSR_MEPC_ADDRESS as u16, instr.borrow().pc + 4);
                        let mut tmp = ref_cell_borrow_mut(&instr);
                        tmp.predict_fail = final_predict_pc != csr_val;
                        tmp.branch_pc = csr_val; // mtvec 
                        tmp.exec = true;
                        drop(tmp);
                    },
                    InstrOpcode::MRET => {
                        println!("mret");
                        let instr = req.1.clone();
                        let final_predict_pc:u64 = if instr.borrow().predicted_direction {instr.borrow().predicted_pc} 
                                                else {instr.borrow().pc + 4};
                        let pc_val = self.csrf.borrow().get(CSR_MEPC_ADDRESS);
                        // TODO: 将特权级设置成 CSRs[mstatus].MPP,
                        // * CSRs[mstatus].MIE 置成 CSRs[mstatus].MPIE, 并且将 CSRs[mstatus].MPIE 为 1
                        let mpie = (self.csrf.borrow().get(CSR_MSTATUS_ADDRESS) & MSTATUS_MPIE as u64) >> MSTATUS_MPIE_LOW;
                        ref_cell_borrow_mut(&self.csrf).set(CSR_MSTATUS_ADDRESS as u16, ((mpie  << (MSTATUS_MPIE_LOW as u64)) | MSTATUS_MPIE as u64) as u64);
                        let mut tmp = ref_cell_borrow_mut(&instr);
                        tmp.predict_fail = final_predict_pc != pc_val;
                        tmp.branch_pc = pc_val; // mtvec 
                        tmp.exec = true;
                        drop(tmp);
                    },
                    _ =>{
                        panic!("illegal syscall opcode in csr");
                    }
                }   
            }
            // println!("csr req in {:016x}", req.1.borrow().pc);
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
    use crate::cfg::regfile_cfg::CSR_MTVEC_ADDRESS;
    use crate::instr::Instr;
    use crate::interface::{Interface, CtrlSignals};
    use crate::instr::intsr_type::InstrOpcode::*;
    use crate::utils::ref_cell_borrow_mut;
    use std::sync::Arc;
    use std::mem::drop;
    use crate::memory::regfiles::CSRF;

    #[test]
    fn basic_csr_test(){
        let csrf = Arc::new(RefCell::new(CSRF::new()));
        let mut csr = CSR::new(csrf.clone(), 1);
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut csr_m = ref_cell_borrow_mut(&csrf);
        csr_m.set(0, 0xf0);
        csr_m.set(CSR_MTVEC_ADDRESS, 0x8000_1000);
        drop(csr_m);
        // csrci
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_csr = true;
        tmp.decoded.opcode_type = CSRRWI;
        tmp.decoded.zimm = 0x0f;
        tmp.decoded.rd = 1;
        tmp.decoded.rs1 = 1;
        drop(tmp);

        csr.req_i((true, instr.clone()));
        csr.tik();
        assert_eq!(csr.resp_o().0, true);
        assert_eq!(csr.resp_o().1.borrow().wb_vld, true);
        assert_eq!(csr.resp_o().1.borrow().wb_data, 0xf0);
        csr.rdy_i(true);

        // ecall
        // println!("1");
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_csr = false;
        tmp.decoded.csr = 1;
        tmp.decoded.is_syscall = true;
        tmp.wb_vld = false; // reset

        tmp.decoded.opcode_type = ECALL;
        tmp.decoded.zimm = 0x0f;
        drop(tmp);

        // println!("1");
        csr.req_i((true, instr.clone()));
        // println!("2");
        csr.tik();
        assert_eq!(csr.resp_o().0, true);
        assert_eq!(csr.resp_o().1.borrow().wb_vld, false);
        // assert_eq!(csr.resp_o().1.borrow().wb_data, 0xf0);
        assert_eq!(csr.resp_o().1.borrow().predict_fail, true);
        assert_eq!(csr.resp_o().1.borrow().branch_pc, 0x8000_1000);
        csr.rdy_i(true);
    }
}