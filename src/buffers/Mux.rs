use std::{fmt::Debug};
use std::default::Default;
#[derive(Default, Debug)]
pub struct Mux<T>{ // Mux n-m
    input_num: u8,
    output_num: u8,

    req_i: Vec<(bool, T)>,
    // rdy_o: Vec<bool>,

    // resp_o: Vec<(bool, T)>,
    rdy_i:Vec<bool>,
}

impl<T> Mux<T>
where T : Default + Debug + Clone
 {
    pub fn new(input_num:u8, output_num:u8) -> Self{
        Mux{
            input_num:input_num,
            output_num:output_num,
            req_i: vec![(false, Default::default()); input_num as usize],
            rdy_i: vec![false; output_num as usize]
        }
    }   
    pub fn req_i(&mut self, req:Vec<(bool, T)>){
        assert_eq!(req.len(), self.input_num as usize);
        self.req_i = req;
    }
    pub fn rdy_o(&self) -> Vec<bool>{
        let mut rdy_v: Vec<bool> = vec![false; self.input_num as usize];
        let mut tmp = self.output_num;
        for i in 0..self.input_num as usize{
            if tmp > 0 && self.req_i[i].0{
                rdy_v[i] = true;
                tmp -= 1;
            }
            if tmp == 0{
                break;
            }
        }
        rdy_v
    }

    pub fn rdy_i(&mut self, rdy:Vec<bool>){
        assert_eq!(rdy.len(), self.output_num as usize);
        self.rdy_i = rdy;
    }
    pub fn resp_o(&self) -> Vec<(bool, T)>{
        let mut resp_v:Vec<(bool, T)> = vec![(false, Default::default()); self.output_num as usize];
        let mut pt = 0;
        for i in 0..self.input_num as usize{
            if self.req_i[i].0{
                resp_v[pt] = self.req_i[i].clone();
                pt += 1;
                if pt == self.output_num as usize{
                    break;
                }
            }   
        }
        resp_v
    }
}
#[cfg(test)]
mod test{
    use crate::buffers::mux::Mux;
    #[test]
    fn basic_mux_test(){
        let mut mux = Mux::<u32>::new(3, 2);

        mux.req_i(vec![(false, 1), (true, 2), (true, 3)]);
        mux.rdy_i(vec![true, true]);
        let correct_resp = vec![(true, 2), (true, 3)];
        let correct_rdy = vec![false, true, true];
        assert_eq!(mux.rdy_o(), correct_rdy);
        assert_eq!(mux.resp_o(), correct_resp);

        mux.req_i(vec![(false, 1), (true, 2), (false, 3)]);
        mux.rdy_i(vec![true, true]);
        let correct_resp = vec![(true, 2), (false, 0)];
        let correct_rdy = vec![false, true, false];
        assert_eq!(mux.rdy_o(), correct_rdy);
        assert_eq!(mux.resp_o(), correct_resp);

        mux.req_i(vec![(true, 1), (true, 2), (true, 3)]);
        mux.rdy_i(vec![true, true]);
        let correct_resp = vec![(true, 1), (true, 2)];
        let correct_rdy = vec![true, true, false];
        assert_eq!(mux.rdy_o(), correct_rdy);
        assert_eq!(mux.resp_o(), correct_resp);

        mux.req_i(vec![(false, 1), (true, 2), (false, 3)]);
        mux.rdy_i(vec![true, false]);
        let correct_resp = vec![(true, 2), (false, 0)];
        let correct_rdy = vec![false, true, false];
        assert_eq!(mux.rdy_o(), correct_rdy);
        assert_eq!(mux.resp_o(), correct_resp);
    }
}