use crate::interface::CtrlSignals;

use super::pht::{PHT, PFSM};
pub struct GShare{
    history: u64,

    history_width: u32,
    pc_width: u32,
    pc_low:usize,
    _pc_hash:bool,

    pht:PHT
}

impl GShare {
    pub fn new(history_width: u32, pc_width: u32, pc_low:usize, pc_hash:bool, pfsm:PFSM) -> Self{
        GShare{
            history: 0u64,
            history_width: history_width,
        
            pc_width: pc_width,
            pc_low:pc_low,
            _pc_hash:pc_hash,
        
            pht:PHT::new(2usize.pow(history_width), 2usize.pow(pc_width), pfsm)
        }
    }

    pub fn branch(&mut self, pc:u64, direction: bool){
        let pc_cut = self.pc_cut(pc);
        let history_cut = self.history_cut();
        self.pht.branch(pc_cut as usize, history_cut as usize, direction);
        if direction{
            self.history = (self.history << 1) + 1;
        }
        else{
            self.history = (self.history << 1) + 0;
        }
    }

    pub fn predict(&self, pc:u64) -> bool{
        let pc_cut = self.pc_cut(pc);
        let history_cut = self.history_cut();
        self.pht.predict(pc_cut as usize, history_cut as usize)
    }

    fn pc_cut(&self, pc:u64) -> u64{
        (pc >> self.pc_low) & ((1 << self.pc_width) - 1)
    }

    fn history_cut(&self) -> u64{
        self.history & ((1 << self.history_width) - 1)
    }
} 

impl CtrlSignals for GShare{
    fn tik(&mut self){

    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.history = 0;
            self.pht.rst(rst);
        }
    }
    fn flush(&mut self, rst:bool){
        if rst{
            self.history = 0;
            self.pht.flush(rst);
        }
    }
}

#[cfg(test)]
mod test{
    use super::{GShare, PFSM};
    #[test]
    fn basic_gshare_tests(){
        let pfsm:PFSM = Default::default();
        let mut gshare = GShare::new(2, 2, 0, false, pfsm);
        gshare.branch(0x8000_0000, true);
        assert_eq!(gshare.history_cut(), 0b01);
        gshare.branch(0x8000_0000, false);
        assert_eq!(gshare.history_cut(), 0b10);
        gshare.branch(0x8000_0000, false);
        assert_eq!(gshare.history_cut(), 0b00);
        gshare.branch(0x8000_0000, true);
        assert_eq!(gshare.history_cut(), 0b01);
        gshare.branch(0x8000_0000, true);
        assert_eq!(gshare.history_cut(), 0b11);
    }
}