use crate::buffers::delay_fifo::{DelayFIFO};
use std::sync::Arc;
use std::cell::RefCell;

use crate::interface::{CtrlSignals, Interface};
use crate::instr::Instr;
use crate::utils::*;
use crate::instr::intsr_type::InstrOpcode::*;
use crate::cfg::regfile_cfg::APF_MAPPING;
pub struct MUL{
    output: DelayFIFO<Arc<RefCell<Instr>>>,
}

impl MUL {
    pub fn new(delay: u16) -> Self{
        MUL { 
            output: DelayFIFO::new(1, vec![delay])
        }
    }

    fn calc(& self, instr: &Instr) -> u64{
        let rs1 = instr.rs1_data;
        let rs2 = instr.rs2_data;
        println!("{:?} rs1:{:x} rs2:{:x}", instr.decoded.opcode_type, rs1, rs2);
        match instr.decoded.opcode_type{
            MUL => ((rs1 as i64 as u128).wrapping_mul(rs2 as i64 as u128)) as u64,
            MULW => sext(((rs1 as i32).wrapping_mul(rs2 as i32)) as u64, 31),
            MULH => ((rs1 as i64 as u128).wrapping_mul(rs2 as i64 as u128) >> 64) as u64,
            MULHSU => ((rs1 as i64 as u128).wrapping_mul(rs2 as u128) >> 64) as u64,
            MULHU => (((rs1 as u128).wrapping_mul(rs2 as u128)) >> 64) as u64,
            DIV => {
                if rs2 != 0 {
                    ((rs1 as i64).wrapping_div(rs2 as i64)) as u64
                }
                else {
                    -1i64 as u64
                }
            },
            DIVW => {
                if rs2 as i32 != 0 {
                    sext(((rs1 as i32).wrapping_div(rs2 as i32)) as u64, 31)
                }
                else {
                    -1i64 as u64
                }
            },
            DIVU => {
                if rs2 != 0{
                    rs1.wrapping_div(rs2)
                }
                else{
                    0xffff_ffff_ffff_ffff
                }
            },
            DIVUW => {
                if rs2 as u32 != 0{
                    sext(((rs1 as u32).wrapping_div(rs2 as u32)) as u64, 31)
                }
                else{
                    0xffff_ffff_ffff_ffff
                }
            },
            REM => {
                if rs2 != 0{
                    ((rs1 as i64).wrapping_rem(rs2 as i64)) as u64
                }
                else {
                    rs1
                }
            },
            REMW => {
                if rs2 as i32 != 0{
                    sext(((rs1 as i32).wrapping_rem(rs2 as i32)) as u64, 31)
                }
                else {
                    rs1
                }
            },
            REMU => {
                if rs2 != 0{
                    rs1.wrapping_rem(rs2)
                }
                else {
                    rs1
                }
            },
            REMUW => {
                if rs2 as u32 != 0{
                    sext(((rs1 as u32).wrapping_rem(rs2 as u32)) as u64, 31)
                }
                else {
                    rs1
                }
            }, 
            _ => panic!("invalid opcode type for mul: {:?}", instr.decoded.opcode_type)
        }
        
    }
}

impl Interface for MUL{
    type Input = Arc<RefCell<Instr>>;
    type Output = Arc<RefCell<Instr>>;

    fn req_i(&mut self, req:(bool, Self::Input)){
        // if req.0{
        //     println!("mul req in: {:016x}, mul rdy:{}", req.1.borrow().pc, self.rdy_o());
        // }
        if self.output.rdy_o() && req.0 && req.1.borrow().decoded.is_mul{ //hsk
            if !req.1.borrow().exception_vld{
                let instr = req.1.clone();
                let val = self.calc(&instr.borrow());
                let mut tmp = ref_cell_borrow_mut(&instr);
                tmp.wb_vld = true;
                tmp.wb_data = val;
                tmp.exec = true;
                drop(tmp);
            }
            self.output.req_i((true, req.1.clone()));
            // self.output.display();
        }
    }
    fn rdy_o(&self) -> bool{
        self.output.rdy_o()
    }

    fn resp_o(&self) -> (bool, Self::Output){
        if self.output.resp_o().0{
            println!("mul resp {:016x}: 0x{:016x} -> {:?}", self.output.resp_o().1.borrow().pc, self.output.resp_o().1.borrow().wb_data, APF_MAPPING[self.output.resp_o().1.borrow().decoded.rd as usize])
        }
        self.output.resp_o().clone()
    }
    fn rdy_i(&mut self, rdy:bool){
        self.output.rdy_i(rdy);
    }
}

impl CtrlSignals for MUL{
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
    use crate::backend::mul::MUL;
    use crate::instr::Instr;
    use crate::interface::{Interface, CtrlSignals};
    use crate::utils::ref_cell_borrow_mut;
    use std::sync::Arc;
    use std::mem::drop;

    #[test]
    fn basic_mul_test(){
        let mut mul = MUL::new(1);
        let instr = Arc::new(RefCell::new(Instr::new(0x0)));
        
        // add
        let mut tmp = ref_cell_borrow_mut(&instr);
        tmp.decoded.is_mul = true;
        tmp.decoded.opcode_type = MUL;
        tmp.rs1_data = 0x2;
        tmp.rs2_data = 0x2;
        drop(tmp);

        mul.req_i((true, instr.clone()));
        mul.tik();
        assert_eq!(mul.resp_o().0, true);
        assert_eq!(mul.resp_o().1.borrow().wb_vld, true);
        assert_eq!(mul.resp_o().1.borrow().wb_data, 0x2 * 0x2);
        mul.rdy_i(true);

    }
}