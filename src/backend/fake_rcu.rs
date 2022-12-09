use std::cell::{RefCell};
use crate::buffers::delay_fifo::{DelayFIFO};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::memory::regfiles::{ARF, CSRF};
use crate::buffers::mux::Mux;
use crate::utils::*;
use std::sync::Arc;
pub struct FakeRCU{ // get pc and visit pht/btb to get a new pc
    // pc_i: Vec<(bool, u32)>,
    // input: Mux<u32>, 
    output: DelayFIFO<Arc<RefCell<Instr>>>,
    commit: DelayFIFO<Arc<RefCell<Instr>>>,
    commit_mux: Mux<Arc<RefCell<Instr>>>,
    arf: Arc<RefCell<ARF>>,
    csrf: Arc<RefCell<CSRF>>
}

impl FakeRCU{
    pub fn new(arf: Arc<RefCell<ARF>>, csrf: Arc<RefCell<CSRF>>) -> Self{
        FakeRCU{
            output: DelayFIFO::new(1, vec![1]),
            commit: DelayFIFO::new(8, vec![1]),
            commit_mux: Mux::new(4, 1), // alu bru csr lsu -> rcu
            arf:arf,
            csrf:csrf
        }
    }

    pub fn commit(&mut self,comm: Vec<(bool, Arc<RefCell<Instr>>)>) -> Vec<bool>{
        self.commit_mux.req_i(comm);
        self.commit_mux.rdy_i(self.gen_rdy_o());
        let instr = &self.commit_mux.resp_o()[0].1;
        if self.commit_mux.resp_o().get(0).unwrap().0 && self.commit.rdy_o(){
            if instr.borrow().wb_vld{
                ref_cell_borrow_mut(&self.arf).set(instr.borrow().decoded.rd, instr.borrow().wb_data);
            }
            if instr.borrow().csr_wb_vld{
                ref_cell_borrow_mut(&self.csrf).set(instr.borrow().decoded.csr, instr.borrow().csr_wb_data);
            }
            ref_cell_borrow_mut(&instr).done = true;
            self.commit.req_i((true, instr.clone()));
        }
        self.commit_mux.rdy_o()
    }
    fn gen_rdy_o(&self) -> Vec<bool>{
        vec![self.commit.rdy_o(); 1]
    }
}

impl Interface for FakeRCU{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
            // assert!(req.1.borrow().pc_vld);
        let instr:Arc<RefCell<Instr>> = req.1.clone();
        let rs1_data = self.arf.borrow().get(instr.borrow().decoded.rs1);
        let rs2_data = self.arf.borrow().get(instr.borrow().decoded.rs2);
        let csr_data = self.csrf.borrow().get(instr.borrow().decoded.csr);
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.rs1_data = rs1_data;
        tmp.rs2_data = rs2_data;
        tmp.csr_data = csr_data;
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

impl CtrlSignals for FakeRCU{
    fn tik(&mut self){
        self.output.tik();
        self.commit.tik();
        // TODO: handle finished req
        self.commit.rdy_i(true); // dump finished req 
    }
    fn rst(&mut self, rst:bool){
        self.output.rst(rst);
        self.commit.rst(rst);
    }
    fn flush(&mut self, rst:bool){
        self.output.flush(rst);
        self.commit.flush(rst);
    }
}

#[cfg(test)]
mod test{
    use std::cell::{RefCell};
    use std::vec;
    use crate::interface::{CtrlSignals, Interface};
    use crate::instr::Instr;
    use crate::memory::regfiles::{ARF, CSRF};
    use crate::utils::*;
    use std::sync::Arc;
    use super::FakeRCU;
    #[test]
    fn basic_fake_rcu_test(){
        let arf = Arc::new(RefCell::new(ARF::new()));
        let csrf = Arc::new(RefCell::new(CSRF::new()));
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut fake_rcu = FakeRCU::new(arf.clone(), csrf.clone());
        
        // rcu get data
        let mut arf_m = ref_cell_borrow_mut(&arf);
        arf_m.set(0, 0xf0);
        arf_m.set(1, 0x0f);
        drop(arf_m);
        let mut csrf_m = ref_cell_borrow_mut(&csrf);
        csrf_m.set(0, 0xdead_beaf);
        drop(csrf_m);

        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.rs1 = 0;
        tmp.decoded.rs2 = 1;
        tmp.decoded.csr = 0;
        drop(tmp);

        fake_rcu.req_i((true, instr.clone()));
        fake_rcu.tik();
        assert_eq!(fake_rcu.resp_o().0, true);
        assert_eq!(fake_rcu.resp_o().1.borrow().csr_data, 0xdead_beaf);
        assert_eq!(fake_rcu.resp_o().1.borrow().rs1_data, 0xf0);
        assert_eq!(fake_rcu.resp_o().1.borrow().rs2_data, 0x0f);
        fake_rcu.rdy_i(true);

        // rcu wb data
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.wb_vld = true;
        tmp.wb_data = 0xdead_beaf;
        tmp.decoded.rd = 3;
        
        tmp.decoded.csr = 3;
        tmp.csr_wb_vld = true;
        tmp.csr_wb_data = 0x1234_4321;
        drop(tmp);

        assert_ne!(arf.borrow().get(3), 0xdead_beaf);
        assert_ne!(csrf.borrow().get(3), 0x1234_4321);
        let rdy = fake_rcu.commit(vec![(false, Default::default()), (true, instr.clone()), (false, Default::default()), (false, Default::default())]);
        assert_eq!(rdy, [false, true, false, false]);
        fake_rcu.tik();
        assert_eq!(arf.borrow().get(3), 0xdead_beaf);
        assert_eq!(csrf.borrow().get(3), 0x1234_4321);
    }
}