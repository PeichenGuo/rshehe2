pub mod pht;
pub mod btb;
pub mod gshare;

use crate::bpu::{btb::BTB, gshare::GShare, pht::PFSM};
use crate::interface::CtrlSignals;
pub struct BPU{
    btb: BTB,
    gshare: GShare,
}

impl BPU {
    pub fn new(btb_pc_width: usize, btb_pc_low:usize, btb_width:usize, gshare_history_width: u32, 
        gshare_pc_width: u32, gshare_pc_low:usize, gshare_pc_hash:bool, pfsm:PFSM) -> Self{
        BPU{
            btb: BTB::new(btb_width, btb_pc_low, btb_pc_width),
            gshare: GShare::new(gshare_history_width, gshare_pc_width, gshare_pc_low, gshare_pc_hash, pfsm)
        }
    }

    pub fn branch(&mut self, pc:u64, direction: bool, target:u64){
        self.btb.branch(pc, target);
        self.gshare.branch(pc, direction);
    }

    pub fn predict(&mut self, pc:u64) -> (bool, u64){
        let btb_predict = self.btb.predict(pc);
        let gshare_predict = self.gshare.predict(pc);
        (gshare_predict & btb_predict.0, btb_predict.1)
    }
} 

impl CtrlSignals for BPU{
    fn tik(&mut self){

    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.btb.rst(rst);
            self.gshare.rst(rst);
        }
    }
    fn flush(&mut self, rst:bool){
        if rst{
            self.btb.flush(rst);
            self.gshare.flush(rst);
        }
    }
}