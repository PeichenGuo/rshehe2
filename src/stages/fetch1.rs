use std::cell::{RefCell, Ref};

use crate::buffers::DelayFIFO::{DelayFIFO};
use crate::buffers::Mux::{Mux};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use std::sync::Arc;
// use std::
pub struct Fetch1{ // get pc and visit pht/btb to get a new pc
    // pc_i: Vec<(bool, u32)>,
    pc_mux: Mux<u64>, 
    output: DelayFIFO<Arc<RefCell<Instr>>>,
    
}

impl Fetch1 {
    pub fn new(pc_i_size: u8) -> Self{
        Fetch1{
            // pc_i: vec![(false, 0); pc_i_size as usize],
            pc_mux: Mux::new(pc_i_size, 1),
            output: DelayFIFO::<Arc<RefCell<Instr>>>::new(1, vec![1]),
        }
    }

    pub fn pc_i(&mut self, pc_i: Vec<(bool, u64)>){
        self.pc_mux.req_i(pc_i);
        self.pc_mux.rdy_i(self.gen_rdy_o());
        if self.pc_mux.resp_o().get(0).unwrap().0 && self.output.rdy_o(){ // hsk
            let tmp = Arc::new(RefCell::new(Instr::new(self.pc_mux.resp_o().get(0).unwrap().1)));
            self.output.req_i((true, tmp.clone()));
        }
    }

    fn gen_rdy_o(&self) -> Vec<bool>{
        vec![self.output.rdy_o(); 1]
    }
}

impl Interface for Fetch1{
    type Input = u32;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        panic!("fetch1 do not impl Interface::req_i, please use pc_i.");
    }
    fn rdy_o(&self) -> bool{{
        self.gen_rdy_o()[0]
    }}

    fn resp_o(&self) -> (bool, Self::Output){
        self.output.resp_o()
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
    use crate::{stages::fetch1::Fetch1, interface::{Interface, CtrlSignals}};
    use crate::instr::Instr;
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
        
        for i in 0..100{
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