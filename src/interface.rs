pub trait Interface {
    type Input;
    type Output;

    fn req_i(&mut self, req:(bool, Self::Input));
    fn rdy_o(&self) -> bool;

    fn resp_o(&self) -> (bool, Self::Output);
    fn rdy_i(&mut self, rdy:bool);
}

pub trait CtrlSignals{
    fn tik(&mut self);
    fn rst(&mut self, rst:bool);
    fn flush(&mut self, rst:bool);
    // fn wfi(&mut self, rst:bool)
}