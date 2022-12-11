use crate::buffers::delay_fifo::{DelayFIFO};
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::InstrOpcode::*;

pub struct ALU{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl ALU {
    pub fn new(delay: u16) -> Self{
        ALU { 
            output: DelayFIFO::new(1, vec![delay])
        }
    }

    fn calc(& self, instr: &Instr) -> u64{
        match instr.decoded.opcode_type{
            ADD => instr.rs1_data.wrapping_add(instr.rs2_data),
            ADDI => instr.rs1_data.wrapping_add(sext(instr.decoded.immi as u64, 11)),
            ADDW => sext(instr.rs1_data.wrapping_add(instr.rs2_data), 31),
            ADDIW => sext(instr.rs1_data.wrapping_add(sext(instr.decoded.immi as u64, 11)), 31),
            
            SUB => instr.rs1_data.wrapping_sub(instr.rs2_data),
            SUBW => sext(instr.rs1_data.wrapping_sub(instr.rs2_data), 31),
            
            SLL => instr.rs1_data.wrapping_shl(instr.rs2_data as u32),
            SLLI => instr.rs1_data.wrapping_shl(instr.decoded.shamt as u32),
            SLLW => sext(instr.rs1_data.wrapping_shl(instr.rs2_data as u32), 31),
            SLLIW => sext(instr.rs1_data.wrapping_shl(instr.decoded.shamt as u32), 31),
            
            SLT => signed_less_than(instr.rs1_data, instr.rs2_data) as u64,
            SLTI => signed_less_than(instr.rs1_data, sext(instr.decoded.immi as u64, 11)) as u64,
            SLTU => (instr.rs1_data < instr.rs2_data) as u64,
            SLTIU => (instr.rs1_data < sext(instr.decoded.immi as u64, 11)) as u64,
            
            XOR => instr.rs1_data ^ instr.rs2_data,
            XORI => instr.rs1_data ^ sext(instr.decoded.immi as u64, 11),
            
            SRL => instr.rs1_data.wrapping_shr(instr.rs2_data as u32),
            SRLI => instr.rs1_data.wrapping_shr(instr.decoded.shamt as u32),
            SRLW => sext(instr.rs1_data.wrapping_shr(instr.rs2_data as u32), 31),
            SRLIW => sext(instr.rs1_data.wrapping_shr(instr.decoded.shamt as u32) , 31),
            
            SRA => sra64(instr.rs1_data, instr.rs2_data),
            SRAI => sra64(instr.rs1_data, instr.decoded.shamt as u64),
            SRAW => sext(sra64(instr.rs1_data, instr.rs2_data), 31),
            SRAIW => sext(sra64(instr.rs1_data, instr.decoded.shamt as u64), 31),
            
            OR => instr.rs1_data | instr.rs2_data,
            ORI => instr.rs1_data | sext(instr.decoded.immi as u64, 11),
            
            AND => instr.rs1_data & instr.rs2_data,
            ANDI => instr.rs1_data & sext(instr.decoded.immi as u64, 11),
            
            AUIPC => instr.pc.wrapping_add(sext(instr.decoded.immu as u64, 31)),
            LUI => instr.decoded.immu as u64,
            _ => panic!("invalid opcode type for alu: {:?}", instr.decoded.opcode_type)
        }
    }
}

impl Interface for ALU{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        if self.rdy_o() && req.0 && req.1.borrow().decoded.is_alu{ //hsk
            if !req.1.borrow().exception_vld{
                let instr = req.1.clone();
                let val = self.calc(&instr.borrow());
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.wb_vld = true;
                tmp.wb_data = val;
                tmp.exec = true;
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

impl CtrlSignals for ALU{
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

#[cfg(test)]
mod test{
    use std::cell::RefCell;
    use crate::backend::alu::ALU;
    use crate::instr::Instr;
    use crate::interface::{Interface, CtrlSignals};
    use crate::instr::intsr_type::InstrOpcode::*;
    use crate::utils::ref_cell_borrow_mut;
    use std::sync::Arc;
    use std::mem::drop;

    #[test]
    fn basic_alu_test(){
        let mut alu = ALU::new(1);
        let instr = Arc::new(RefCell::new(Instr::new(0x0)));
        
        // add
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_alu = true;
        tmp.decoded.opcode_type = ADD;
        tmp.rs1_data = 0x1;
        tmp.rs2_data = 0x2;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0x1 + 0x2);
        alu.rdy_i(true);

        // addi without sext
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = ADDI;
        tmp.rs1_data = 0x1;
        tmp.decoded.immi = 0x02;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0x1 + 0x2);
        alu.rdy_i(true);

        // addi with sext
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = ADDI;
        tmp.rs1_data = 0x1;
        tmp.decoded.immi = 0x800;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0xffff_ffff_ffff_f801);
        alu.rdy_i(true);

        // addw 
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = ADDW;
        tmp.rs1_data = 0x1;
        tmp.rs2_data = 0x1000_0000_0000_0002;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0x3);
        alu.rdy_i(true);

        // SLLIW 
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = SLLIW;
        tmp.rs1_data = 0x8000_0001;
        tmp.decoded.shamt = 0x1;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0x02);
        alu.rdy_i(true);

        // SLTI
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = SLTI;
        tmp.rs1_data = 0x1;
        tmp.decoded.immi = 0x2;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 1);
        alu.rdy_i(true);

        // SLTI
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = SLTI;
        tmp.rs1_data = 0x1;
        tmp.decoded.immi = 0x802;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0);
        alu.rdy_i(true);

        // SRA
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.opcode_type = SRA;
        tmp.rs1_data = 0x8000_0000_0000_0000;
        tmp.rs2_data = 1;
        drop(tmp);

        alu.req_i((true, instr.clone()));
        alu.tik();
        assert_eq!(alu.resp_o().0, true);
        assert_eq!(alu.resp_o().1.borrow().wb_vld, true);
        assert_eq!(alu.resp_o().1.borrow().wb_data, 0xc000_0000_0000_0000);
        alu.rdy_i(true);
    }
}