

use std::cell::{RefCell};
use std::sync::Arc;

use crate::frontend::{fetch1::Fetch1, fetch2::Fetch2, decode::Decode};
use crate::memory::Memory;
use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;

pub mod fetch1;
pub mod fetch2;
pub mod decode;
pub struct Frontend{
    fetch1: Arc<RefCell<Fetch1>>,
    fetch2: Arc<RefCell<Fetch2>>,
    decode: Arc<RefCell<Decode>>,
}

impl Frontend {
    pub fn new(mem: Arc<RefCell<Memory>>) -> Self{
        Frontend { 
            fetch1: (Arc::new(RefCell::new(Fetch1::new(4)))), 
            fetch2: (Arc::new(RefCell::new(Fetch2::new(mem.clone())))), 
            decode: (Arc::new(RefCell::new(Decode::new()))), 
        }
    }

    pub fn resp_o(&self) -> (bool, Arc<RefCell<Instr>>){
        self.decode.borrow().resp_o().clone()
    }
    pub fn rdy_i(&mut self, rdy: bool){
        ref_cell_borrow_mut(&self.decode).rdy_i(rdy)
    }
}

impl CtrlSignals for Frontend{
    fn tik(&mut self){
        // ! 严格注意这里的vld rdy顺序。只有给了rdy，resp那条才会commit，才会给后面的指令腾地方。
        // ! 因此比较反直觉的是，这里的vld-rdy握手是逆序的，从后面往前处理，才能让后面的接受者有地方接受
        let f2_resp = self.fetch2.borrow().resp_o();
        println!("f2_resp {:?}", &f2_resp);

        ref_cell_borrow_mut(&self.decode).req_i(self.fetch2.borrow().resp_o());
        ref_cell_borrow_mut(&self.fetch2).rdy_i(self.decode.borrow().rdy_o());

        let f1_resp = self.fetch1.borrow().resp_o();
        println!("f1_resp {} {:08x}", f1_resp.0, f1_resp.1.borrow().pc);
        ref_cell_borrow_mut(&self.fetch2).req_i(self.fetch1.borrow().resp_o());
        ref_cell_borrow_mut(&self.fetch1).rdy_i(self.fetch2.borrow().rdy_o());
        let f1_pc_i: Vec<(bool, u64)> = vec![
            (false, 0), // branch unit
            (f1_resp.1.borrow().predicted_direction , f1_resp.1.borrow().predicted_pc), // branch predict
            (f1_resp.0, f1_resp.1.borrow().pc + 4), // pc + 4
            (true, 0x8000_0000) // start_pc
        ];
        let _f1_rdy_o = ref_cell_borrow_mut(&self.fetch1).pc_i(f1_pc_i);
        // no need to give rdy

        

        ref_cell_borrow_mut(&self.fetch1).tik();
        ref_cell_borrow_mut(&self.fetch2).tik();
        ref_cell_borrow_mut(&self.decode).tik();
        println!();
    }
    fn rst(&mut self, rst:bool){
        ref_cell_borrow_mut(&self.fetch1).rst(rst);
        ref_cell_borrow_mut(&self.fetch2).rst(rst);
        ref_cell_borrow_mut(&self.decode).rst(rst);
    }
    fn flush(&mut self, rst:bool){
        ref_cell_borrow_mut(&self.fetch1).flush(rst);
        ref_cell_borrow_mut(&self.fetch2).flush(rst);
        ref_cell_borrow_mut(&self.decode).flush(rst);
    }
}


#[cfg(test)]
mod test{
    use std::cell::{RefCell};
    use std::sync::Arc;

    use crate::memory::Memory;
    use crate::interface::{CtrlSignals};
    use crate::instr::{intsr_type::InstrOpcode};
    use crate::frontend::Frontend;

    #[test]
    fn frontend_basic_test_on_add(){
        let mem = Arc::new(RefCell::new(Memory::new()));
        mem.borrow_mut().read_file("./isa_tests/add.hex", 0x8000_0000);

        let mut frontend = Frontend::new(mem.clone());
        assert_eq!(frontend.resp_o().0, false);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, false);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, false);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::JAL);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_csr, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::CSRRS);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_alu, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::ADDI);
        frontend.rdy_i(true);


        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::BEQ);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_alu, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::ADDI);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::BEQ);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_alu, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::ADDI);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::BEQ);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        // assert_eq!(frontend.resp_o().1.borrow().decoded.is_alu, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::AUIPC);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_alu, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::ADDI);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::BEQ);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::JALR);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_csr, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::CSRRS);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::BGE);
        frontend.rdy_i(true);

        frontend.tik();
        assert_eq!(frontend.resp_o().0, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded_vld, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.is_branch, true);
        assert_eq!(frontend.resp_o().1.borrow().decoded.opcode_type, InstrOpcode::JAL);
        frontend.rdy_i(true);
    }
}