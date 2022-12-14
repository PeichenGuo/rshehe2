use std::cell::{RefCell};

use crate::buffers::fifo::{DelayFIFO};
use crate::buffers::mux::{Mux};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::ref_cell_borrow_mut;
use crate::bpu::{BPU, pht::PFSM};
use std::sync::Arc;
use crate::cfg::frontend_cfg::*;
// use std::
pub struct Fetch1{ // get pc and visit pht/btb to get a new pc
    // pc_i: Vec<(bool, u32)>,
    pc_mux: Mux<u64>, 
    output: DelayFIFO<Arc<RefCell<Instr>>>,
    bpu: BPU
}

impl Fetch1 {
    pub fn new(pc_i_size: u8) -> Self{
        Fetch1{
            // pc_i: vec![(false, 0); pc_i_size as usize],
            pc_mux: Mux::new(pc_i_size, 1),
            output: DelayFIFO::<Arc<RefCell<Instr>>>::new(1, vec![1]),
            bpu:BPU::new(BTB_PC_WIDTH, BTB_PC_LOW, BTB_PC_WIDTH, GSHARE_HISTORY_WIDTH as u32, GSHARE_PC_WIDTH as u32, 
                GSHARE_PC_LOW, GSHARE_PC_DO_HASH, PFSM::default())
        }
    }

    pub fn pc_i(&mut self, pc_i: Vec<(bool, u64)>) -> Vec<bool>{
        self.pc_mux.req_i(pc_i);
        self.pc_mux.rdy_i(self.gen_rdy_o());
        if self.pc_mux.resp_o().get(0).unwrap().0 && self.output.rdy_o(){ // hsk
            let instr = Arc::new(RefCell::new(Instr::new(self.pc_mux.resp_o().get(0).unwrap().1)));
            let mut tmp = ref_cell_borrow_mut(&instr);
            tmp.predicted_direction = false;
            tmp.predicted_pc = 0;
            drop(tmp);
            // println!("fetch1 pc_mux_in: 0x{:016x}", instr.borrow().pc);
            self.output.req_i((true, instr.clone()));
        }
        self.pc_mux.rdy_o()
    }

    fn gen_rdy_o(&self) -> Vec<bool>{
        vec![self.output.rdy_o(); 1]
    }
}

impl Interface for Fetch1{
    type Input = u32;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, _req:(bool, Self::Input)){
        panic!("fetch1 do not impl Interface::req_i, please use pc_i.");
    }
    fn rdy_o(&self) -> bool{{
        panic!("fetch1 do not impl Interface::rdy_o, please use pc_i.");
    }}

    fn resp_o(&self) -> (bool, Self::Output){
        self.output.resp_o().clone()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for Fetch1{
    fn tik(&mut self){
        self.output.tik();
    }
    fn rst(&mut self, rst:bool){
        self.output.rst(rst);
    }
    fn flush(&mut self, rst:bool){
        self.output.flush(rst)
    }
}

#[cfg(test)]
mod test{
    use crate::{frontend::fetch1::Fetch1, interface::{Interface, CtrlSignals}};
    #[test]
    fn basic_fetch1_test(){
        let mut fetch1 = Fetch1::new(4);
        let mut addr:u64 = 0x8000_0000;

        fetch1.pc_i(vec![
            (false, 0), // branch unit
            (false, 0), // predict
            (false, 0), // pc + 4
            (true, addr) // start pc
        ]); 
        fetch1.rdy_i(true);
        assert_eq!(fetch1.resp_o().0, false);
        fetch1.tik();
        assert_eq!(fetch1.resp_o().0, true);
        assert_eq!(fetch1.resp_o().1.borrow().pc_vld, true);
        assert_eq!(fetch1.resp_o().1.borrow().pc, addr, 
            "fetch1 resp data wrong 0x{:8x} - 0x{:8x}", fetch1.resp_o().1.borrow().pc, addr);
        fetch1.rdy_i(true);
        
        for _i in 0..100{
            addr += 4;
            fetch1.pc_i(vec![
                (false, 0), // branch unit
                (false, 0), // predict
                (true, addr), // pc + 4
                (true, 0x8000_0000) // start pc
            ]);

            fetch1.tik();
            assert_eq!(fetch1.resp_o().0, true);
            assert_eq!(fetch1.resp_o().1.borrow().pc_vld, true);
            assert_eq!(fetch1.resp_o().1.borrow().pc, addr, 
                "fetch1 resp data wrong 0x{:8x} - 0x{:8x}", fetch1.resp_o().1.borrow().pc, addr);
            fetch1.rdy_i(true);
        }
        

    }
}