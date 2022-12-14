use std::{collections::{HashMap, HashSet}};

use crate::interface::CtrlSignals;
#[derive(Clone, Debug)]
pub struct PFSM{
    state: usize,
    start: usize,
    jump_map: HashMap<usize, (usize, usize)>,
    accept_set: HashSet<usize>
}

impl PFSM {
    pub fn new(start: usize, jump_map:HashMap<usize, (usize, usize)>, accept_set: HashSet<usize>) -> Self{
        PFSM{
            state: start,
            start: start,
            jump_map: jump_map,
            accept_set: accept_set
        }
    }

    pub fn branch(&mut self, direction: bool){
        if direction{
            self.state = self.jump_map.get(&self.state).unwrap().1;
        }
        else{
            self.state = self.jump_map.get(&self.state).unwrap().0;
        }
    }

    pub fn predict(&self) -> bool{
        self.accept_set.contains(&self.state)
    }
}

impl Default for PFSM {
    fn default() -> Self {
        let start = 0b01;
        let mut jump_map =  HashMap::<usize, (usize, usize)>::new();
        jump_map.insert(0b00, (0b00, 0b01));
        jump_map.insert(0b01, (0b00, 0b10));
        jump_map.insert(0b10, (0b01, 0b11));
        jump_map.insert(0b11, (0b10, 0b11));
        let mut accept_set = HashSet::<usize>::new();
        accept_set.insert(0b11);
        accept_set.insert(0b10);
        PFSM{
            start: start,
            state: start,
            jump_map: jump_map,
            accept_set: accept_set
        }
    }
}

impl CtrlSignals for PFSM{
    fn tik(&mut self){
    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.state = self.start;
        }
    }
    fn flush(&mut self, rst:bool){
        if rst{
            self.state = self.start;
        }
    }
}

pub struct PHT{
    pfsm_table: Vec<Vec<PFSM>>,
}

impl PHT {
    pub fn new(w:usize, l: usize, pfsm: PFSM) -> Self{
        PHT{
            pfsm_table:{
                vec![vec![pfsm;l];w]
            }
        }
    }

    pub fn branch(&mut self, w:usize, l: usize, direction: bool){
        self.pfsm_table[w][l].branch(direction);
    }

    pub fn predict(&self, w:usize, l: usize) -> bool{
        self.pfsm_table[w][l].predict()
    }
}

impl CtrlSignals for PHT{
    fn tik(&mut self){
    }
    fn rst(&mut self, rst:bool){
        for i in 0..self.pfsm_table.len(){
            for j in 0..self.pfsm_table[i].len(){
                self.pfsm_table[i][j].rst(rst);
            }
        }
    }
    fn flush(&mut self, rst:bool){
        for i in 0..self.pfsm_table.len(){
            for j in 0..self.pfsm_table[i].len(){
                self.pfsm_table[i][j].flush(rst);
            }
        }
    }
}

#[cfg(test)]
mod test{
    use crate::bpu::pht::PFSM;
    use std::default::Default;
    #[test]
    fn basic_pfsm_test(){
        let mut fsm: PFSM = Default::default();
        assert!(!fsm.predict()); // 01

        fsm.branch(true); // 10
        assert!(fsm.predict());

        fsm.branch(true); // 11
        assert!(fsm.predict());

        fsm.branch(true); // 11
        assert!(fsm.predict());

        fsm.branch(false); // 10
        assert!(fsm.predict());

        fsm.branch(false); // 01
        assert!(!fsm.predict());

        fsm.branch(true); // 10
        assert!(fsm.predict());

        fsm.branch(false); // 01
        assert!(!fsm.predict());

        fsm.branch(false); // 00
        assert!(!fsm.predict());

        fsm.branch(true); // 01
        assert!(!fsm.predict());

        fsm.branch(true); // 10
        assert!(fsm.predict());
    }
}