
// use crate::cfg::memory_cfg::*;
// use crate::cfg::core_cfg;

use frontend::Frontend;
use backend::FakeBackend;
use interface::CtrlSignals;
use memory::{memory::Memory, regfiles::{ARF, CSRF}};
use utils::ref_cell_borrow_mut;
use std::{sync::Arc};
use std::cell::RefCell;
use cfg::memory_cfg::*;

pub mod memory;
pub mod cfg;
pub mod instr;
pub mod interface;
pub mod buffers;
pub mod frontend;
pub mod backend;
pub mod utils;

#[macro_use]
extern crate lazy_static;

pub struct HeHeCore{
    frontend: Arc<RefCell<Frontend>>,
    backend: Arc<RefCell<FakeBackend>>,
    mem: Arc<RefCell<Memory>>,
    _arf: Arc<RefCell<ARF>>,
    _csrf: Arc<RefCell<CSRF>>,
}

impl HeHeCore{
    pub fn new() -> Self{
        let mem = Arc::new(RefCell::new(Memory::new()));
        let arf = Arc::new(RefCell::new(ARF::new()));
        let csrf = Arc::new(RefCell::new(CSRF::new()));
        let frontend = Arc::new(RefCell::new(Frontend::new(mem.clone())));
        let backend = Arc::new(RefCell::new(FakeBackend::new(mem.clone(), arf.clone(), csrf.clone())));
        HeHeCore { 
            frontend: frontend.clone(), 
            backend: backend.clone(), 
            mem: mem.clone(), 
            _arf: arf.clone(), 
            _csrf: csrf .clone()
        }
    }
    pub fn load_elf(&self, d:&str){
        ref_cell_borrow_mut(&self.mem).read_file(d, ELF_START_PADDR);
    }

    pub fn test_done(&self) -> bool{
        self.mem.borrow().test_done()
        
    }

    pub fn read_from_host(&self) -> u32{
        self.mem.borrow().lw(TOHOST_PADDR) as u32
    }
}

impl CtrlSignals for HeHeCore{
    fn tik(&mut self){
        let frontend_req = self.frontend.borrow().resp_o();
        ref_cell_borrow_mut(&self.backend).req_i(self.frontend.borrow().resp_o());
        ref_cell_borrow_mut(&self.frontend).rdy_i(self.backend.borrow().rdy_o());
        if self.frontend.borrow().resp_o().0{
            println!("frontend req: pc-{:016x}", self.frontend.borrow().resp_o().1.borrow().pc)
        }
        // println!("frontend_req({}, {})", frontend_req.0, frontend_req.1.borrow());

        ref_cell_borrow_mut(&self.frontend).flush(self.backend.borrow().flush_o());
        // if self.backend.borrow().flush_o(){
        //     println!("flush!");
        // }
        ref_cell_borrow_mut(&self.frontend).branch_i(self.backend.borrow().branch_o());
        // if self.backend.borrow().branch_o().0 {
        //     println!("branch {} - 0x{:0x}", self.backend.borrow().branch_o().0, 
        //         self.backend.borrow().branch_o().1);
        // }
        
        ref_cell_borrow_mut(&self.frontend).tik();
        ref_cell_borrow_mut(&self.backend).tik();

        println!();
    }
    fn rst(&mut self, rst:bool){
        ref_cell_borrow_mut(&self.frontend).rst(rst);
        ref_cell_borrow_mut(&self.backend).rst(rst);
    }
    fn flush(&mut self, rst:bool){
        ref_cell_borrow_mut(&self.frontend).flush(rst);
        ref_cell_borrow_mut(&self.backend).flush(rst);
    }
}
#[cfg(test)]
mod test{
    use std::thread::panicking;

    use crate::{HeHeCore, interface::CtrlSignals};
    #[test]
    fn add_isa_test(){
        let mut core = HeHeCore::new();
        core.load_elf("./isa_tests/add.hex");
        for _i in 0..1000{
            core.tik();
            if core.read_from_host() == 1{
                println!("test succ!");
                break;
            }
            else if core.read_from_host() != 0{
                panic!("test fail @ {}", core.read_from_host());
            }
        }
        panic!("time limit reach");
    }
}