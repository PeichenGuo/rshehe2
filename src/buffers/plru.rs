use std::{fmt::Debug, default};

use crate::interface::CtrlSignals;

#[derive(Default, Debug)]
pub struct BufPLRU<T, D>{
    max_size:u16,
    tag: Vec<T>,
    vld: Vec<bool>,
    data: Vec<D>,
    tree: Vec<bool>, // true points left, false points right
}

impl<T, D> CtrlSignals for BufPLRU<T, D>
    where T: Default + Debug + Clone + Copy  + PartialEq, 
          D: Default + Debug + Clone + Copy  + PartialEq
{
    fn tik(&mut self){
       
    }
    fn rst(&mut self, rst:bool){
        if rst {
            self.vld = vec![false; self.max_size as usize];
            self.tree= vec![true; self.max_size as usize - 1];
        }
    }
    fn flush(&mut self,rst:bool){
        if rst {
            self.vld = vec![false; self.max_size as usize];
            self.tree= vec![true; self.max_size as usize - 1];
        }
    }
    // fn wfi(&mut self,rst:bool){
        
    // }
}

impl<T, D> BufPLRU<T, D>
    where T: Default + Debug + Clone + Copy  + PartialEq,
          D: Default + Debug + Clone + Copy + PartialEq
{
    pub fn new(size: u16) -> Self{
        BufPLRU{
            max_size:size,
            vld: vec![false; size as usize],
            tag: vec![Default::default(); size as usize],
            data: vec![Default::default(); size as usize],
            tree: vec![true; size as usize - 1], // true points left, false points right
        }
    }

    pub fn insert(&mut self, val: (T,D)){
        let mut pt = 0;
        for lvl in 0..((self.max_size as f64).log2() as usize){
            let direction = self.tree[pt];
            self.tree[pt] = !self.tree[pt];
            let past_levels_size = 2usize.pow(lvl as u32) - 1;
            let nxt_level_start = 2usize.pow((lvl + 1) as u32) - 1;
            let this_level_index = pt - past_levels_size;
            pt = nxt_level_start + this_level_index * 2 + if direction {0} else {1};
        }
        pt -= self.max_size as usize - 1;
        self.vld[pt] = true;
        self.tag[pt] = val.0;
        self.data[pt] = val.1;
        println!("after insert {:?}", self.tree);
    }

    pub fn get(&mut self, tag: T) -> (bool, D){
        if let Some(id) = self.tag.iter().position(|x| x == &tag){
            self.trace_back(id);
            (self.vld[id], self.data[id])
        } 
        else{
            (false,  Default::default())
        }
    }

    fn trace_back(&mut self, id:usize){
        let mut pt = id + self.max_size as usize - 1;
        println!("before trace back: {:?}", self.tree);
        for lvl in (0..((self.max_size as f64).log2() as usize)).rev(){
            let past_levels_size = 2usize.pow((lvl + 1) as u32) - 1;
            let last_level_start = 2usize.pow(lvl as u32) - 1;
            let direction:bool = pt - past_levels_size % 2 == 0;
            pt = last_level_start + (pt - past_levels_size) / 2;
            if direction != self.tree[pt]{
                self.tree[pt] = !self.tree[pt];
            }
        }
        println!("after trace back: {:?}", self.tree);
    }

    pub fn display(&self){
    }

}

#[cfg(test)]
mod test{
    use crate::{buffers::plru::BufPLRU, interface::{Interface, CtrlSignals}};
    #[test]
    fn basic_plru_test(){
        let mut plru = BufPLRU::<usize, &str>::new(8);

        assert_eq!(plru.get(2).0, false);
        plru.insert((1, "one"));
        assert_eq!(plru.get(1).0, true);
        assert_eq!(plru.get(1).1, "one");
        
        plru.insert((2, "two"));
        plru.insert((3, "three"));
        plru.insert((4, "four"));
        plru.insert((5, "five"));
        plru.insert((6, "five"));
        plru.insert((7, "five"));
        plru.insert((8, "five"));
        plru.insert((9, "five"));

        assert_eq!(plru.get(1).0, false);

        assert_eq!(plru.get(2).0, true);
        assert_eq!(plru.get(2).1, "two");

        plru.insert((10, "ten"));

        assert_eq!(plru.get(2).0, true);
        assert_eq!(plru.get(2).1, "two");


        plru.flush(true);
        assert_eq!(plru.get(2).0, false);
        plru.insert((1, "one"));
        assert_eq!(plru.get(1).0, true);
        assert_eq!(plru.get(1).1, "one");

    }
}
