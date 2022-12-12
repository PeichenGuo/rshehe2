use std::cell::{RefCell};

use crate::buffers::delay_fifo::{DelayFIFO};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::{Instr, decoded_instr::DecodedInstr};
use std::sync::Arc;
use crate::instr::intsr_type::InstrOpcode::*;

use crate::cfg::core_cfg::*;

use crate::utils::*;
pub struct Decode{ // get pc and visit pht/btb to get a new pc
    // pc_i: Vec<(bool, u32)>,
    // input: Mux<u32>, 
    branch_onflight: bool, 
    branch_onflight_q: bool, 
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl Decode{
    pub fn new() -> Self{
        Decode { 
            branch_onflight: false,
            branch_onflight_q: false,
            output: DelayFIFO::new(1, vec![1]),
        }
    }
}

impl Interface for Decode{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        // println!("branch_onflight: {}, branch_onflight_q: {}", self.branch_onflight, self.branch_onflight_q);
        if self.branch_onflight_q{
            self.output.req_i((false, Default::default()));
            return;
        }
        if req.0 && self.rdy_o(){ // hsk
            let docoded_instr: DecodedInstr = DecodedInstr::new(req.1.borrow().raw);
            if docoded_instr.is_branch || docoded_instr.is_syscall{
                self.branch_onflight = true;
                // println!("branch on flight set @ instr: {:016x}", req.1.borrow().pc);
            }
            let mut tmp = ref_cell_borrow_mut(&req.1);
            if docoded_instr.illegale_instr {
                tmp.exception_vld = true;
                tmp.ecause = EXCEPTION_UNIMPL_INSTR;
            }
            else if docoded_instr.opcode_type == ECALL || docoded_instr.opcode_type == EBREAK{
                tmp.exception_vld = true;
                tmp.ecause = EXCEPTION_ENV_CALL_M; // FIXME: m mode only
            }
            tmp.decoded_vld = true;
            tmp.decoded = docoded_instr;
            drop(tmp);
        }
        // if req.0 {
        //     println!("decode req in @ {:016x}", req.1.borrow().pc);
        // }
        let req_i = (req.0, req.1.clone());
        self.output.req_i(req_i);
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o() && !self.branch_onflight_q.clone()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        // if self.output.resp_o().0{
        //     println!("decode resp vld : instr {:16x}", self.output.resp_o().1.borrow().pc);
        // }
        self.output.resp_o().clone()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for Decode {
    fn tik(&mut self){
        self.branch_onflight_q = self.branch_onflight;
        self.output.tik();
    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.branch_onflight = false;
            self.branch_onflight_q = false;
        }
        self.output.rst(rst);
    }
    fn flush(&mut self, rst:bool){
        if rst {println!("decode flush")};
        if rst{
            self.branch_onflight = false;
            self.branch_onflight_q = false;
        }
        self.output.flush(rst);
    }
}

#[cfg(test)]
mod test{
    use std::{cell::RefCell};

    use crate::{frontend::decode::Decode, interface::{Interface, CtrlSignals}};
    use crate::instr::{Instr};
    use std::sync::Arc;
    use crate::utils::*;
    #[test]
    fn basic_fetch2_test(){
        let mut decode = Decode::new();
        
        let req = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        ref_cell_borrow_mut(&req).raw_vld = true;
        ref_cell_borrow_mut(&req).raw = 0x00051063;

        decode.req_i((true, req));

        assert_eq!(decode.resp_o().0, false);
        decode.tik();
        assert_eq!(decode.resp_o().0, true);
        let resp:Arc<RefCell<Instr>> = decode.resp_o().1;
        assert_eq!(resp.borrow().decoded_vld, true);
        assert_eq!(ref_cell_borrow_mut(&resp).decoded.is_branch, true);
        // decode.resp_o()
        // for i in 0..100{
        //     println!("{:08x}",decode.resp_o().1.borrow().raw);
        //     decode.rdy_i(true);
        //     decode.req_i((true, Arc::new(RefCell::new(Instr::new(addr)))));
        //     addr += 4;
        //     decode.tik();
        // }
        // assert!(false);
    }
}