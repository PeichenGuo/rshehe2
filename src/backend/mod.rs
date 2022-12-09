
pub mod alu;
pub mod fake_lsu;
pub mod branch_unit;
pub mod csr;
pub mod fake_rcu;

use std::{sync::Arc, cell::RefCell};

use crate::{backend::{alu::ALU, fake_lsu::FakeLSU, branch_unit::BRU, csr::CSR, fake_rcu::FakeRCU}, memory::{memory::Memory, regfiles::{ARF, CSRF}}, utils::ref_cell_borrow_mut};
use crate::instr::Instr;
use crate::interface::{CtrlSignals, Interface};
pub struct FakeBackend{
    alu: Arc<RefCell<ALU>>,
    lsu: Arc<RefCell<FakeLSU>>,
    bru: Arc<RefCell<BRU>>,
    csr: Arc<RefCell<CSR>>,
    rcu: Arc<RefCell<FakeRCU>>,

    // mem:Arc<RefCell<Memory>>,
    // arf:Arc<RefCell<ARF>>,
    // csrf:Arc<RefCell<CSRF>>,
}

impl FakeBackend {
    pub fn new(mem: Arc<RefCell<Memory>>, arf:Arc<RefCell<ARF>>, csrf:Arc<RefCell<CSRF>>) -> Self{
        FakeBackend { 
            alu: Arc::new(RefCell::new(ALU::new())), 
            lsu: Arc::new(RefCell::new(FakeLSU::new(mem.clone()))), 
            bru: Arc::new(RefCell::new(BRU::new())), 
            csr: Arc::new(RefCell::new(CSR::new())), 
            rcu: Arc::new(RefCell::new(FakeRCU::new(arf.clone(), csrf.clone()))), 
            // mem: (mem.clone()), 
            // arf: (arf.clone()), 
            // csrf: (csrf.clone()) 
        }
    }
    pub fn flush_o(&self) -> bool{
        self.rcu.borrow().flush_o() 
    }
    pub fn branch_o(&self) -> (bool, u64){
        self.rcu.borrow().branch_o()
    }
    // ! backend parse first 因为需要让rcu先处理腾出地方
    // ! 值得注意的是，顺序应该是 backend -> frontend -> flush/branch赋值
    pub fn req_i(&mut self, req:(bool, Arc<RefCell<Instr>>)){
        ref_cell_borrow_mut(&self.rcu).req_i(req); // no need to clone. req itself is a clone, and req_i does a clone too
    }
    pub fn rdy_o(&self) -> bool{
        self.rcu.borrow().rdy_o()
    }
}

impl  CtrlSignals for FakeBackend {
    fn tik(&mut self){
        if self.rcu.borrow().flush_o(){
            self.flush(true);
        }
        else{
            // rcu commit 
            let bru_resp = self.bru.borrow().resp_o();
            let lsu_resp = self.lsu.borrow().resp_o();
            let csr_resp = self.csr.borrow().resp_o();
            let alu_resp = self.alu.borrow().resp_o();
            // println!("alu_resp({}, {})", alu_resp.0, alu_resp.1.borrow());
            
            let mut tmp = ref_cell_borrow_mut(&self.rcu);
            let rdy = tmp.commit(vec![bru_resp, lsu_resp, csr_resp, alu_resp]);
            drop(tmp);

            let mut bru_tmp = ref_cell_borrow_mut(&self.bru);
            bru_tmp.rdy_i(rdy[0]);
            drop(bru_tmp);

            let mut lsu_tmp = ref_cell_borrow_mut(&self.lsu);
            lsu_tmp.rdy_i(rdy[1]);
            drop(lsu_tmp);

            let mut csr_tmp = ref_cell_borrow_mut(&self.csr);
            csr_tmp.rdy_i(rdy[2]);
            drop(csr_tmp);

            let mut alu_tmp = ref_cell_borrow_mut(&self.alu);
            alu_tmp.rdy_i(rdy[3]);
            drop(alu_tmp);

            // fu req
            let mut rcu_tmp = ref_cell_borrow_mut(&self.rcu);
            let rcu_req = rcu_tmp.resp_o();
            // println!("rcu_req({}, {})", rcu_req.0, rcu_req.1.borrow());

            if rcu_req.1.borrow().decoded.is_alu{
                let mut alu_tmp = ref_cell_borrow_mut(&self.alu);
                alu_tmp.req_i(rcu_req);
                rcu_tmp.rdy_i(alu_tmp.rdy_o());
                drop(alu_tmp);
            }
            else if rcu_req.1.borrow().decoded.is_csr || rcu_req.1.borrow().decoded.is_syscall{
                let mut csr_tmp = ref_cell_borrow_mut(&self.csr);
                csr_tmp.req_i(rcu_req);
                rcu_tmp.rdy_i(csr_tmp.rdy_o());
                drop(csr_tmp);
            }
            else if rcu_req.1.borrow().decoded.is_ld || rcu_req.1.borrow().decoded.is_st{
                let mut lsu_tmp = ref_cell_borrow_mut(&self.lsu);
                lsu_tmp.req_i(rcu_req);
                rcu_tmp.rdy_i(lsu_tmp.rdy_o());
                drop(lsu_tmp);
            }
            else if rcu_req.1.borrow().decoded.is_branch{
                let mut bru_tmp = ref_cell_borrow_mut(&self.bru);
                bru_tmp.req_i(rcu_req);
                rcu_tmp.rdy_i(bru_tmp.rdy_o());
                drop(bru_tmp);
            }
            else{
                // panic!("should not happen, panic anyway");
            }

            // rcu req in
            drop(rcu_tmp);
            // println!();
            // println!();
            // println!();
        }
        ref_cell_borrow_mut(&self.alu).tik();
        ref_cell_borrow_mut(&self.lsu).tik();
        ref_cell_borrow_mut(&self.bru).tik();
        ref_cell_borrow_mut(&self.csr).tik();
        ref_cell_borrow_mut(&self.rcu).tik();
    }
    
    fn rst(&mut self, rst:bool){
        ref_cell_borrow_mut(&self.alu).rst(rst);
        ref_cell_borrow_mut(&self.lsu).rst(rst);
        ref_cell_borrow_mut(&self.rcu).rst(rst);
        ref_cell_borrow_mut(&self.bru).rst(rst);
        ref_cell_borrow_mut(&self.csr).rst(rst);
    }
    fn flush(&mut self, rst:bool){
        ref_cell_borrow_mut(&self.alu).flush(rst);
        ref_cell_borrow_mut(&self.lsu).flush(rst);
        ref_cell_borrow_mut(&self.rcu).flush(rst);
        ref_cell_borrow_mut(&self.bru).flush(rst);
        ref_cell_borrow_mut(&self.csr).flush(rst);
    }
}

#[cfg(test)]
mod test{
    use std::{sync::Arc, cell::RefCell};

    use crate::{memory::{memory::Memory, regfiles::{ARF, CSRF}}, utils::ref_cell_borrow_mut};
    use crate::instr::Instr;
    use crate::interface::{CtrlSignals};
    use crate::instr::intsr_type::{InstrOpcode::*, InstrType::*};

    use super::FakeBackend;
    #[test]
    fn basic_backend_test(){
        let arf = Arc::new(RefCell::new(ARF::new()));
        let csrf = Arc::new(RefCell::new(CSRF::new()));
        let mem = Arc::new(RefCell::new(Memory::new()));
        let mut backend = FakeBackend::new(mem.clone(), arf.clone(), csrf.clone());

        // test plan
        // ============== req in ================  ====== req iss =====    ====check=====
        // addi 0xf -> arf[1]
        // addi 0x1 -> arf[2]                       addi -> arf[1]
        // sll arf[1] << arf[2]  -> arf[3]          addi -> arf[2]          check arf[1]
        // sb  arf[3] -> mem[4]                                             check arf[2]
        // lb  arf[4] <- mem[4]                     sll -> arf[3]
        // nop                                      
        // nop                                      sb  arf[3] -> mem[4]    check arf[3]
        // nop                                      ld arf[4] <- mem[4] 
        // nop                                                              check arf[4]
        // bne arf[1] arf[2] (predict fail)
        // nop                                      bne arf[1] arf[2]       
        // nop                                                              flush_vld 
        // TODO: need check flush did happend

        // addi 0xf -> arf[1]
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_alu = true;
        tmp.decoded.opcode_type = ADDI;
        tmp.decoded.instr_type = I;
        tmp.decoded.rs1 = 0;
        tmp.decoded.rs2 = 1;
        tmp.decoded.immi = 0xf;
        tmp.decoded.rd = 0x1;
        drop(tmp);

        backend.req_i((true, instr.clone()));
        backend.tik();

        // addi 0x1 -> arf[2]
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_alu = true;
        tmp.decoded.opcode_type = ADDI;
        tmp.decoded.rs1 = 0;
        tmp.decoded.instr_type = I;
        tmp.decoded.immi = 0x1;
        tmp.decoded.rd = 0x2;
        drop(tmp);

        backend.req_i((true, instr.clone()));
        backend.tik();
        assert_ne!(0xf, arf.borrow().get(1));

        // sll rs1 << rs2  -> arf[3]
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_alu = true;
        tmp.decoded.opcode_type = SLL;
        tmp.decoded.instr_type = R;
        tmp.decoded.rs1 = 1;
        tmp.decoded.rs2 = 2;
        tmp.decoded.rd = 0x3;
        drop(tmp);

        backend.req_i((true, instr.clone()));
        backend.tik();
        assert_eq!(0xf, arf.borrow().get(1));


        // sb  arf[3] -> mem[4]
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_st = true;
        tmp.decoded.opcode_type = SB;
        tmp.decoded.instr_type = S;
        tmp.decoded.rs1 = 4;
        tmp.decoded.rs2 = 3;
        drop(tmp);

        backend.req_i((true, instr.clone()));
        backend.tik();
        assert_eq!(0x1, arf.borrow().get(2));

        // lb  arf[4] <- mem[4]
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_ld = true;
        tmp.decoded.opcode_type = LB;
        tmp.decoded.instr_type = I;
        tmp.decoded.rs1 = 0;
        tmp.decoded.immi = 3;
        tmp.decoded.rd = 0x4;
        drop(tmp);

        backend.req_i((true, instr.clone()));
        backend.tik();

        // nop
        backend.tik();

        // nop
        backend.tik();
        assert_eq!(0xf << 0x1, arf.borrow().get(3));
        // assert_eq!(0xf << 0x1, arf.borrow().get(4));

        // nop
        backend.tik();

        // nop
        backend.tik();
        assert_eq!(0xf << 0x1, arf.borrow().get(4));

        // bne  arf[1] arf[2] 
        let instr = Arc::new(RefCell::new(Instr::new(0x8000_0000)));
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_branch = true;
        tmp.decoded.opcode_type = BNE;
        tmp.decoded.instr_type = B;
        tmp.decoded.rs1 = 1;
        tmp.decoded.rs2 = 2;
        tmp.decoded.immb = 0x123;

        tmp.predicted_direction = false;
        drop(tmp);
        backend.req_i((true, instr.clone()));
        backend.tik();

        // nop
        backend.tik();

        // nop
        backend.tik();
        assert_eq!(backend.branch_o(), (true, 0x8000_0123));

    }
}