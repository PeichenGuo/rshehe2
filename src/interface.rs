pub trait Interface {
    type Item;

    fn req_i(&mut self, req:(bool, Self::Item));
    fn rdy_o(&self) -> bool;

    fn resp_o(&self) -> (bool, Self::Item);
    fn rdy_i(&mut self, rdy:bool);

    fn tik(&mut self);
    fn rst(&mut self, rst:bool);
    fn flush(&mut self, rst:bool);
    // fn wfi(&mut self, rst:bool)
}