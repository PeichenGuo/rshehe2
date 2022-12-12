use std::cell::{RefCell};
use crate::buffers::delay_fifo::{DelayFIFO};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::memory::memory::Memory;
use crate::utils::ref_cell_borrow_mut;
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
        let raw = self.mem.borrow().lw(req.1.borrow().pc as u64) as u32;
        if req.1.borrow().pc == 0x80000158{
            println!("80000158 raw:{:8x}", raw);
        }
        let mut tmp = ref_cell_borrow_mut(&req.1);
        tmp.raw_vld = true;
        tmp.raw = raw;
        drop(tmp);
        self.output.req_i(req.clone());
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

    use crate::{frontend::fetch2::Fetch2, interface::{Interface, CtrlSignals}};
    use crate::instr::Instr;
    use std::sync::Arc;
    use crate::memory::memory::Memory;
    #[test]
    fn basic_fetch2_test(){
        let mem = Arc::new(RefCell::new(Memory::new()));
        mem.borrow_mut().read_file("./tests/isa/build/hex/rv64ui/add.hex", 0x8000_0000);
        let mut fetch2 = Fetch2::new(mem.clone());
        let addr:u64 = 0x8000_0000;

        
        fetch2.req_i((true, Arc::new(RefCell::new(Instr::new(addr)))));
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