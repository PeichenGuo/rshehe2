use std::cell::{RefCell};
use crate::buffers::fifo::{DelayFIFO};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::{Instr, intsr_type::InstrType};
use crate::memory::regfiles::{ARF, CSRF};
use crate::buffers::mux::Mux;
use crate::utils::*;
use std::sync::Arc;
use crate::cfg::backend_cfg::*;
use crate::instr::intsr_type::InstrOpcode;
use crate::cfg::{regfile_cfg::*};
pub struct FakeRCU{ // get pc and visit pht/btb to get a new pc
    // pc_i: Vec<(bool, u32)>,
    // input: Mux<u32>, 
    output: DelayFIFO<Arc<RefCell<Instr>>>,
    commit: DelayFIFO<Arc<RefCell<Instr>>>,
    commit_mux: Mux<Arc<RefCell<Instr>>>,
    arf: Arc<RefCell<ARF>>,
    csrf: Arc<RefCell<CSRF>>,

    branch_num: u64,
    predict_fail_num: u64,

    branch: (bool, u64, bool, u64),
    flush: bool
}

impl FakeRCU{
    pub fn new(arf: Arc<RefCell<ARF>>, csrf: Arc<RefCell<CSRF>>, iss_delay: u16, comm_delay: u16) -> Self{
        FakeRCU{
            output: DelayFIFO::new(RCU_ROB_SIZE as u16, vec![iss_delay]),
            commit: DelayFIFO::new(RCU_RETIRE_BUFFER_SIZE as u16, vec![comm_delay]), // 8 slot防止堵塞。 rcu只能在最后tik，因此在收到commit的时候实际上应该出队的指令还在队中
            commit_mux: Mux::new(FU_NUM as u8, FU_COMMIT_NUM as u8), // alu bru csr lsu -> rcu
            arf:arf,
            csrf: csrf,
            branch: (false, 0, false, 0),
            flush: false,
            branch_num:0,
            predict_fail_num:0
        }
    }

    pub fn commit(&mut self,comm: Vec<(bool, Arc<RefCell<Instr>>)>) -> Vec<bool>{
        // if self.commit_mux.resp_o().get(0).unwrap().0{
        //     println!("{}", self.commit_mux.resp_o().get(0).unwrap().1.borrow());
        // }
        self.commit_mux.req_i(comm);
        // println!("rcu commit mux req in :{:?}", self.gen_rdy_o());
        self.commit_mux.rdy_i(self.gen_rdy_o());
        let instr = &self.commit_mux.resp_o()[0].1;
        println!("rcu commit mux in:{} - {:016x}", self.commit_mux.resp_o()[0].0, instr.borrow().pc);
        if self.commit_mux.resp_o()[0].0 && self.commit.rdy_o(){
            if !self.commit_mux.resp_o().get(0).unwrap().1.borrow().exception_vld{
                if instr.borrow().wb_vld{
                    let mut tmp = ref_cell_borrow_mut(&self.arf);
                    tmp.set(instr.borrow().decoded.rd, instr.borrow().wb_data);
                    drop(tmp);
                }
                if instr.borrow().decoded.csr_we{
                    ref_cell_borrow_mut(&self.csrf).set(instr.borrow().decoded.csr, instr.borrow().csr_wb_data);
                }
                self.set_free(instr.clone());
            }
            ref_cell_borrow_mut(&instr).done = true;
            self.commit.req_i((true, instr.clone()));
            // self.commit.display()
        }
        self.commit_mux.rdy_o()
    }
    fn gen_rdy_o(&self) -> Vec<bool>{
        vec![self.commit.rdy_o(); 1]
    }
    fn iss_rdy(&self) -> bool{
        match self.output.resp_o().1.borrow().decoded.instr_type{
            InstrType::R | InstrType::S | InstrType::B => {
                !self.arf.borrow().get_busy(self.output.resp_o().1.borrow().decoded.rs1) &&
                !self.arf.borrow().get_busy(self.output.resp_o().1.borrow().decoded.rs2)
            },
            InstrType::I => {
                // println!("arf {} busy:{}",self.output.resp_o().1.borrow().decoded.rs1, self.arf.borrow().get_busy(self.output.resp_o().1.borrow().decoded.rs1));
                // println!("csr({}): {} busy:{}",self.output.resp_o().1.borrow().decoded.is_csr, self.output.resp_o().1.borrow().decoded.csr, self.csrf.borrow().get_busy(self.output.resp_o().1.borrow().decoded.csr));
                !self.arf.borrow().get_busy(self.output.resp_o().1.borrow().decoded.rs1) && 
                (!self.output.resp_o().1.borrow().decoded.csr_we || !self.csrf.borrow().get_busy(self.output.resp_o().1.borrow().decoded.csr))
            },
            _ => true,
        }
    }
    fn set_busy(&self, instr: Arc<RefCell<Instr>>){
        // println!("instr @ {:016x} set busy {}", instr.borrow().pc, APF_MAPPING[instr.borrow().decoded.rd as usize]);
        match instr.borrow().decoded.instr_type{
            InstrType::R | InstrType::U | InstrType::I | InstrType::J => {
                let mut tmp = ref_cell_borrow_mut(&self.arf);
                tmp.set_busy(instr.borrow().decoded.rd, true);
                drop(tmp);
                if instr.borrow().decoded.csr_we{
                    ref_cell_borrow_mut(&self.csrf).set_busy(instr.borrow().decoded.csr, true);
                }
            },
            _ => {},
        }
    }

    fn set_free(&self, instr: Arc<RefCell<Instr>>){
        // println!("instr @ {:016x} set free {}", instr.borrow().pc, APF_MAPPING[instr.borrow().decoded.rd as usize]);
        match instr.borrow().decoded.instr_type{
            InstrType::R | InstrType::U | InstrType::I | InstrType::J => {
                let mut tmp = ref_cell_borrow_mut(&self.arf);
                tmp.set_busy(instr.borrow().decoded.rd, false);
                drop(tmp);
                if instr.borrow().decoded.csr_we{
                    ref_cell_borrow_mut(&self.csrf).set_busy(instr.borrow().decoded.csr, false);
                }
            },
            _ => {},
        }
    }
    pub fn flush_o(&self) -> bool{
        self.flush
    }
    pub fn branch_o(&self) -> (bool, u64, bool, u64){
        self.branch
    }

    pub fn predict_succ_rate(&self) -> f64{
        1f64 - (self.predict_fail_num as f64 / self.branch_num as f64)
    }
}

impl Interface for FakeRCU{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        // if req.0{
        //     println!("rcu req in: pc-{:016x}", req.1.borrow().pc)
        // }
        self.output.req_i(req.clone());
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        let instr:Arc<RefCell<Instr>> = self.output.resp_o().1;
        // println!("self.iss_rdy():{}", self.iss_rdy());
        // if self.output.resp_o().1.borrow().decoded.opcode_type == InstrOpcode::DIVW{
        //     println!("rcu req iss: pc-{:016x} is DIVW", self.output.resp_o().1.borrow().pc);
        // }
        // if self.output.resp_o().0{
        //     println!("rcu iss instr {:016x}. iss_rdy:{}", self.output.resp_o().1.borrow().pc, self.iss_rdy());
        // }
        if self.iss_rdy(){
            let rs1_data = self.arf.borrow().get(instr.borrow().decoded.rs1);
            let rs2_data = self.arf.borrow().get(instr.borrow().decoded.rs2);
            let csr_data = if instr.borrow().decoded.csr_re{
                self.csrf.borrow().get(instr.borrow().decoded.csr)
            }
            else {
                0
            };
            // println!("read arf: rs1:{:16x} rs2:{:16x} csrf:{:16x}", &rs1_data, &rs2_data, &csr_data);
            let mut tmp = ref_cell_borrow_mut(&instr);
            tmp.rs1_data = rs1_data;
            tmp.rs2_data = rs2_data;
            tmp.csr_data = csr_data;
            drop(tmp);
            self.output.resp_o().clone()
        }
        else{
            (false, Default::default())
        }
        
    }
    fn rdy_i(&mut self, rdy:bool){
        let ready = rdy && self.iss_rdy();
        if ready && self.output.resp_o().0{
            self.set_busy(self.output.resp_o().1.clone());
        }
        self.output.rdy_i(ready);
    }
}

impl CtrlSignals for FakeRCU{
    fn tik(&mut self){
        self.output.tik();
        self.commit.tik();
        // TODO: handle finished req
        if self.commit.resp_o().0 && self.commit.resp_o().1.borrow().exception_vld{ // exception
            let instr = self.commit.resp_o().1;
            println!("exception @ {:016x}", instr.borrow().pc);
            // set branch
            let mtvec = self.csrf.borrow().get(CSR_MTVEC_ADDRESS as u16);
            let nxt_pc = instr.borrow().pc + 4;
            let mut tmp = ref_cell_borrow_mut(&instr);
            tmp.branch_vld = true;
            tmp.branch_pc = mtvec; // mtvec 
            drop(tmp);
            // ecasue -> csr[mcause]
            ref_cell_borrow_mut(&self.csrf).set(CSR_MEPC_ADDRESS as u16, nxt_pc);
            ref_cell_borrow_mut(&self.csrf).set(CSR_MCAUSE_ADDRESS as u16, instr.borrow().ecause);
        }

        if self.commit.resp_o().0 && self.commit.resp_o().1.borrow().decoded.opcode_type == InstrOpcode::MRET{ // mret
            let instr = self.commit.resp_o().1;
            // let final_predict_pc:u64 = if instr.borrow().predicted_direction {instr.borrow().predicted_pc} 
            //                         else {instr.borrow().pc + 4};
            let pc_val = self.csrf.borrow().get(CSR_MEPC_ADDRESS);
            // TODO: 将特权级设置成 CSRs[mstatus].MPP,
            // * CSRs[mstatus].MIE 置成 CSRs[mstatus].MPIE, 并且将 CSRs[mstatus].MPIE 为 1
            let mpie = (self.csrf.borrow().get(CSR_MSTATUS_ADDRESS) & MSTATUS_MPIE as u64) >> MSTATUS_MPIE_LOW;
            ref_cell_borrow_mut(&self.csrf).set(CSR_MSTATUS_ADDRESS as u16, ((mpie  << (MSTATUS_MPIE_LOW as u64)) | MSTATUS_MPIE as u64) as u64);
            let mut tmp = ref_cell_borrow_mut(&instr);
            tmp.branch_vld = true;
            tmp.branch_pc = pc_val; // mtvec 
            drop(tmp);
        }

        if self.commit.resp_o().0 && self.commit.resp_o().1.borrow().branch_vld { // FIXME: no pre-exec
            self.flush = true;
            self.branch = (true, self.commit.resp_o().1.borrow().pc, self.commit.resp_o().1.borrow().branch_direction, self.commit.resp_o().1.borrow().branch_pc);
        }
        else{
            self.flush = false;
            self.branch = (false, 0, false, 0);
        }

        if self.commit.resp_o().0 && self.commit.resp_o().1.borrow().decoded.is_branch{
            self.branch_num += 1;
            if self.commit.resp_o().1.borrow().predict_fail{
                self.predict_fail_num += 1;
            }
        }
        if self.commit.resp_o().0{
            println!("req commit:{:0x}", self.commit.resp_o().1.borrow().pc);
        }
        self.commit.rdy_i(true); // dump finished req 
    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.branch = (false, 0, false, 0);
            self.flush = false;
        }
        self.output.rst(rst);
        self.commit.rst(rst);
    }
    fn flush(&mut self, rst:bool){
        if rst{
            self.branch = (false, 0, false, 0);
            self.flush = false;
        }
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
        let csrf = Arc::new(RefCell::new(CSRF::new()));
        let arf = Arc::new(RefCell::new(ARF::new()));
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut fake_rcu = FakeRCU::new(arf.clone(), csrf.clone(),1, 1);
        
        // rcu get data
        let mut arf_m = ref_cell_borrow_mut(&arf);
        arf_m.set(1, 0xf0);
        arf_m.set(2, 0x0f);
        drop(arf_m);

        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.rs1 = 1;
        tmp.decoded.rs2 = 2;
        tmp.decoded.csr = 0;
        drop(tmp);

        fake_rcu.req_i((true, instr.clone()));
        fake_rcu.tik();
        assert_eq!(fake_rcu.resp_o().0, true);
        assert_eq!(fake_rcu.resp_o().1.borrow().rs1_data, 0xf0);
        assert_eq!(fake_rcu.resp_o().1.borrow().rs2_data, 0x0f);
        fake_rcu.rdy_i(true);

        // rcu wb data
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.wb_vld = true;
        tmp.wb_data = 0xdead_beaf;
        tmp.decoded.rd = 3;
        
        tmp.decoded.csr = 3;
        tmp.decoded.is_csr = true;

        tmp.decoded.is_branch = true;
        tmp.branch_vld = true;        
        tmp.branch_pc = 0x8000_1000;
        drop(tmp);

        assert_ne!(arf.borrow().get(3), 0xdead_beaf);
        let rdy = fake_rcu.commit(vec![(false, Default::default()), (true, instr.clone()), (false, Default::default()), (false, Default::default()), (false, Default::default())]);
        assert_eq!(rdy, [false, true, false, false, false]);
        fake_rcu.tik();
        assert_eq!(arf.borrow().get(3), 0xdead_beaf);
        assert_eq!(fake_rcu.flush_o(), true);
        assert_eq!(fake_rcu.branch_o().0, true);

        fake_rcu.tik();
        assert_ne!(fake_rcu.flush_o(), true);
        assert_ne!(fake_rcu.branch_o().0, true);
    }
}