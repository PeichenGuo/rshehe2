use std::{fmt::Debug, default};

use crate::interface::Interface;
use crate::interface::CtrlSignals;

#[derive(Default, Debug)]
pub struct DelayFIFO<T>{
    max_size:u16,
    delay_options: Vec<u16>,
    data: Vec<T>,
    delays: Vec<u16>,
    empty: bool,
    full: bool,
    
    head: u16,
    tail: u16,

    rdy_o:bool,
    resp_o: (bool, T)
}

impl<T> Interface for DelayFIFO<T>
    where T: Clone + Debug + Default
{
    type Input = T;
    type Output = T;

    fn req_i(&mut self, req:(bool, Self::Input)){
        self.rdy_o = !self.full;
        if self.rdy_o && req.0{
            // enque
            if self.data.len() < self.max_size as usize && (self.tail >= self.data.len() as u16){
                self.data.push(req.1);
                self.delays.push(self.delay_options.get(0).unwrap().clone());
            }
            else{
                self.data[self.tail as usize] = req.1;
                self.delays[self.tail as usize] = self.delay_options.get(0).unwrap().clone(); 
            }
            // FIXME: only consider one delay 
            self.tail += 1;
            self.tail %= self.max_size;
            if self.empty {
                self.empty = false;
            }
            if self.tail == self.head{
                self.full = true;
            }
        }
    }
    fn rdy_o(&self) -> bool {
        self.rdy_o
    }

    fn resp_o(&self) -> (bool, Self::Output){
        if !self.empty{ 
            (self.delays[self.head as usize] == 0, self.data[self.head as usize].clone())
        }
        else{
            (false, default::Default::default())
        }
    }
    fn rdy_i(&mut self, rdy:bool){
        // deque
        if  self.resp_o().0 && rdy{
            self.head += 1;
            self.head %= self.max_size;
            if self.full{
                self.full = false;
            }
            if self.head == self.tail {
                self.empty = true;
            }
        }
    }
}

impl<T> CtrlSignals for DelayFIFO<T>
    where T: Default + Debug + Clone
{
    fn tik(&mut self){
        for i in 0..self.delays.len(){
            if self.delays[i] > 0{
                self.delays[i] -= 1;
            }
        }
    }
    fn rst(&mut self, rst:bool){
        if rst{
            self.head = 0;
            self.tail = 0;
            self.empty = true;
            self.full = false;
            self.resp_o = (false, Default::default());
            self.rdy_o = true;
        }
    }
    fn flush(&mut self,rst:bool){
        self.rst(rst);
    }
    // fn wfi(&mut self,rst:bool){
        
    // }
}

impl<T> DelayFIFO<T>
    where T: Default + Debug + Clone
{
    pub fn new(size: u16, delay_options:Vec<u16>) -> Self{
        assert_ne!(size, 0);
        DelayFIFO { 
            max_size: (size), 
            delay_options: (delay_options), 
            data: (Vec::with_capacity(size as usize)), 
            delays: (Vec::with_capacity(size as usize)), 
            empty: (true), 
            full: (false), 
            head: (0), 
            tail: (0), 
            rdy_o:(true),
            resp_o: (false, Default::default())
        }
    }
    pub fn display(&self){
        println!("delay fifo [head:{}, tail:{}, empty:{}, full:{}, resp_o:{}]", self.head, self.tail, self.empty, self.full, self.resp_o.0);
    }

}

#[cfg(test)]
mod test{
    use crate::{buffers::fifo::DelayFIFO, interface::{Interface, CtrlSignals}};
    #[test]
    fn basic_delay_fifo_test(){
        // 0 delay
        let mut fifo = DelayFIFO::<u32>::new(4, vec![0;1]);
        fifo.req_i((true, 1));
        assert_eq!((true, 1), fifo.resp_o());
        fifo.rdy_i(true);
        assert_eq!(false, fifo.resp_o().0);

        // 1 delay
        let mut fifo = DelayFIFO::<u32>::new(4, vec![1;1]);
        fifo.req_i((true, 1));
        assert_eq!(false, fifo.resp_o().0);

        fifo.tik();
        fifo.req_i((true, 2));
        assert_eq!((true, 1), fifo.resp_o());
        fifo.rdy_i(true);

        fifo.tik();
        assert_eq!((true, 2), fifo.resp_o());
        fifo.rdy_i(true);

        fifo.tik();
        assert_eq!(false, fifo.resp_o().0);

        // 5 delay
        let mut fifo = DelayFIFO::<u32>::new(4, vec![5;1]);
        fifo.req_i((true, 1));
        for _i in 0..5{
            assert_eq!(false, fifo.resp_o().0);
            fifo.tik();
        }
        assert_eq!((true, 1), fifo.resp_o());
        fifo.rdy_i(true);
        assert_eq!(false, fifo.resp_o().0);

        // vld-rdy hsk 
        let mut fifo1 = DelayFIFO::<u32>::new(4, vec![1;1]);
        let mut fifo2 = DelayFIFO::<u32>::new(4, vec![1;1]);
        fifo1.req_i((true, 1));
        assert_eq!(false, fifo1.resp_o().0);
        assert_eq!(false, fifo2.resp_o().0);
        fifo1.tik();
        fifo2.tik();
        assert_eq!((true, 1), fifo1.resp_o());
        fifo2.req_i(fifo1.resp_o());
        fifo1.rdy_i(fifo2.rdy_o()); // hsk between fifo1 and fifo2
        assert_eq!(false, fifo2.resp_o().0);
        fifo1.tik();
        fifo2.tik();
        assert_eq!((true, 1), fifo2.resp_o());
        fifo2.rdy_i(true);

        // 1 delay
        let mut fifo = DelayFIFO::<u32>::new(4, vec![1;1]);
        fifo.req_i((true, 1));
        assert_eq!(false, fifo.resp_o().0);
        fifo.tik();
        assert_eq!((true, 1), fifo.resp_o());
        fifo.rdy_i(false);
        assert_eq!((true, 1), fifo.resp_o());
        fifo.tik();
        assert_eq!((true, 1), fifo.resp_o());
        fifo.rdy_i(true);
        assert_eq!(false, fifo.resp_o().0);

    }
}
