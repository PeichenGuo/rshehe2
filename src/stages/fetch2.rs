use std::borrow::BorrowMut;
use std::cell::{RefCell, Ref, RefMut};
use std::process::Output;

use crate::buffers::DelayFIFO::{DelayFIFO};
use crate::buffers::Mux::{Mux};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::memory::Memory;
use std::sync::Arc;
pub struct Fetch2{ // get pc and visit pht/btb to get a new pc
    // pc_i: Vec<(bool, u32)>,
    // input: Mux<u32>, 
    output: DelayFIFO<Arc<RefCell<Instr>>>,
    mem: Arc<RefCell<Memory>>,
}

impl Fetch2{
    pub fn new(mem: Arc<RefCell<Memory>>) -> Self{
        Fetch2 { 
            output: DelayFIFO::new(8, vec![1]),
            mem: mem.clone()
        }
    }
}

impl Interface for Fetch2{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        let req_i = (req.0, req.1.clone());
        if req.0 && self.rdy_o(){ // hsk
            // assert!(req.1.borrow().pc_vld);
            let tmp:Arc<RefCell<Instr>> = req.1.clone();
            // let mut tmp2 = (*tmp).borrow_mut();
            // let mut tmp3 = tmp.borrow_mut();
            // let mut tmp4 = tmp.borrow();
            let raw = self.mem.borrow().lw(req.1.borrow().pc as u64) as u32;
            (*tmp).borrow_mut().raw_vld = true;
            (*tmp).borrow_mut().raw = raw;
        }
        self.output.req_i(req_i);
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        self.output.resp_o()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for Fetch2 {
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
    use std::cell::RefCell;

    use crate::{stages::fetch2::Fetch2, interface::{Interface, CtrlSignals}};
    use crate::instr::Instr;
    use std::sync::Arc;
    use crate::memory::Memory;
    #[test]
    fn basic_fetch2_test(){
        let mut mem = Arc::new(RefCell::new(Memory::new()));
        mem.borrow_mut().read_file("./isa_tests/add.hex", 0x8000_0000);
        let mut fetch2 = Fetch2::new(mem.clone());
        let mut addr:u64 = 0x8000_0000;

        
        fetch2.req_i((true, Arc::new(RefCell::new(Instr::new(addr)))));
        addr += 4;
        assert_eq!(fetch2.resp_o().0, false);
        fetch2.tik();
        assert_eq!(fetch2.resp_o().0, true);
        assert_eq!(fetch2.resp_o().1.borrow().raw_vld, true);
        assert_eq!(fetch2.resp_o().1.borrow().raw, mem.borrow().lw(fetch2.resp_o().1.borrow().pc) as u32);
        // fetch2.resp_o()
        // for i in 0..100{
        //     println!("{:08x}",fetch2.resp_o().1.borrow().raw);
        //     fetch2.rdy_i(true);
        //     fetch2.req_i((true, Arc::new(RefCell::new(Instr::new(addr)))));
        //     addr += 4;
        //     fetch2.tik();
        // }
        // assert!(false);
    }
}