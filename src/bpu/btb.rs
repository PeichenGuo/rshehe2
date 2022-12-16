use crate::{buffers::plru::PLRU, interface::CtrlSignals};
pub struct BTB{
    plru:PLRU<u64, u64>, // pc -> target addr
    pc_low:usize,
    pc_width:usize,
}

impl BTB {
    pub fn new(width: usize, pc_width:usize, pc_low:usize) ->Self{
        println!("pc_low:{}, pc_width:{}", pc_low, pc_width);
        BTB { 
            plru: PLRU::<u64, u64>::new(width),
            pc_low: pc_low,
            pc_width: pc_width
        }
    }
    fn pc_cut(&self, pc:u64) -> u64{
        (pc >> self.pc_low) & ((1 << self.pc_width) - 1)
    }
    pub fn branch (&mut self, pc: u64, target: u64){
        self.plru.insert((self.pc_cut(pc), target))
    }
    pub fn predict(&mut self, pc: u64) -> (bool, u64){
        self.plru.get(self.pc_cut(pc))
    }
    pub fn disaplay(&self){
        self.plru.display();
    }
}

impl CtrlSignals for BTB {
    fn tik(&mut self){

    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.plru.rst(rst);
        }
    }
    fn flush(&mut self, rst:bool){
        if rst{
            self.plru.flush(rst);
        }
    }
}

// TODO: add test for btb