use std::cell::{RefCell};

use crate::buffers::delay_fifo::{DelayFIFO};
use crate::interface::{CtrlSignals, Interface};
use crate::instr::{Instr, decoded_instr::DecodedInstr};
use crate::memory::Memory;
use std::sync::Arc;
use crate::instr::intsr_type::InstrOpcode::*;

use crate::utils::*;

pub struct FakeLSU{
    mem: Arc<RefCell<Memory>>,
    output: DelayFIFO<Arc<RefCell<Instr>>>
}

impl FakeLSU {
    pub fn new(mem: Arc<RefCell<Memory>>) -> Self{
        FakeLSU{
            mem: mem,
            output: DelayFIFO::new(8, vec![1]),
        }
    }
    fn load(&self, instr: &Instr) -> u64{
        match instr.decoded.opcode_type{
            LB => self.mem.borrow().lb(instr.rs1_data),
            LBU => self.mem.borrow().lbu(instr.rs1_data),
            LH => self.mem.borrow().lh(instr.rs1_data),
            LHU => self.mem.borrow().lhu(instr.rs1_data),
            LW => self.mem.borrow().lw(instr.rs1_data),
            LWU => self.mem.borrow().lwu(instr.rs1_data),
            LD => self.mem.borrow().ld(instr.rs1_data),
            _ => panic!("illegal opcode type {:?} for load", instr.decoded.opcode_type)
        }
    }

    fn store(&mut self, instr: &Instr){
        match instr.decoded.opcode_type{
            SB => ref_cell_borrow_mut(&self.mem).sb(instr.rs1_data, instr.rs2_data),
            SH => ref_cell_borrow_mut(&self.mem).sh(instr.rs1_data, instr.rs2_data),
            SW => ref_cell_borrow_mut(&self.mem).sw(instr.rs1_data, instr.rs2_data),
            SD => ref_cell_borrow_mut(&self.mem).sd(instr.rs1_data, instr.rs2_data),
            _ => panic!("illegal opcode type {:?} for store", instr.decoded.opcode_type)
        };
    }
}

impl Interface for FakeLSU{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        if self.rdy_o() && req.0 && (req.1.borrow().decoded.is_st || req.1.borrow().decoded.is_ld) { //hsk
            let instr = req.1.clone();
            if instr.borrow().decoded.is_ld{
                let val = self.load(&instr.borrow());
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.wb_vld = true;
                tmp.wb_data = val;
            }
            else{
                self.store(&instr.borrow());
            }
            self.output.req_i((true, req.1.clone()));
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

impl CtrlSignals for FakeLSU {
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

mod test{
    use std::cell::{RefCell};
    use crate::backend::fake_lsu::FakeLSU;
    use crate::instr::Instr;
    use crate::interface::{Interface, CtrlSignals};
    use crate::instr::intsr_type::InstrOpcode::*;
    use crate::utils::ref_cell_borrow_mut;
    use std::sync::Arc;
    use crate::memory::Memory;
    use std::mem::drop;

    #[test]
    fn basic_fake_lsu_test_on_add_hex(){
        let mem = Arc::new(RefCell::new(Memory::new()));
        ref_cell_borrow_mut(&mem.clone()).read_file("./isa_tests/add.hex", 0);
        let mut fake_lsu = FakeLSU::new(mem.clone());
        let instr = Arc::new(RefCell::new(Instr::new(0x0)));
    
        // ld
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_ld = true;
        tmp.decoded.is_st = false;
        tmp.decoded.opcode_type = LB;
        tmp.wb_vld = false;
        tmp.rs1_data = 0x0;
        // tmp.rs2_data = 0x2;
        drop(tmp);

        fake_lsu.req_i((true, instr.clone()));
        fake_lsu.tik();
        assert_eq!(fake_lsu.resp_o().0, true);
        assert_eq!(fake_lsu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(fake_lsu.resp_o().1.borrow().wb_data, 0x6f);
        fake_lsu.rdy_i(true);

        // st
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_ld = false;
        tmp.decoded.is_st = true;
        tmp.decoded.opcode_type = SB;
        tmp.wb_vld = false;
        tmp.rs1_data = 0x0;
        tmp.rs2_data = 0x2b;
        drop(tmp);

        fake_lsu.req_i((true, instr.clone()));
        fake_lsu.tik();
        assert_eq!(fake_lsu.resp_o().0, true);
        assert_eq!(fake_lsu.resp_o().1.borrow().wb_vld, false);
        // assert_eq!(fake_lsu.resp_o().1.borrow().wb_data, 0x6f);
        assert_eq!(mem.borrow().lb(0), 0x2b);
        fake_lsu.rdy_i(true);

        
    }
}