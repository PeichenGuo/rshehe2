use std::{fmt::Debug};

use crate::interface::CtrlSignals;

#[derive(Default, Debug)]
pub struct PLRU<T, D>{
    width:usize,
    max_size:usize,
    tag: Vec<T>,
    vld: Vec<bool>,
    data: Vec<D>,
    tree: Vec<bool>, // true points left, false points right
}

impl<T, D> CtrlSignals for PLRU<T, D>
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

impl<T, D> PLRU<T, D>
    where T: Default + Debug + Clone + Copy  + PartialEq,
          D: Default + Debug + Clone + Copy + PartialEq
{
    pub fn new(width: usize) -> Self{
        let size = 2u32.pow(width as u32);
        PLRU{
            width:width,
            max_size:size as usize,
            vld: vec![false; size as usize],
            tag: vec![Default::default(); size as usize],
            data: vec![Default::default(); size as usize],
            tree: vec![true; size as usize - 1], // true points left, false points right
        }
    }

    pub fn insert(&mut self, val: (T,D)){
        if self.get(val.0).0{
            // FIXME: lazy code, 2logn, should be 1logn
            self.update(val.0, val.1);
        }
        else{
            let mut pt = 0;
            for lvl in 0..self.width{
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
        }
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

    pub fn update(&mut self, tag:T, data:D){
        if let Some(id) = self.tag.iter().position(|x| x == &tag){
            self.trace_back(id);
            self.data[id] = data;
        } 
    }

    fn trace_back(&mut self, id:usize){
        let mut pt = id + self.max_size as usize - 1;
        println!("before trace back: {:?}", self.tree);
        for lvl in (0..self.width).rev(){
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
    use crate::{buffers::plru::PLRU, interface::{CtrlSignals}};
    #[test]
    fn basic_plru_test(){
        let mut plru = PLRU::<usize, &str>::new(3);

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
