#[cfg(test)]
mod test{
    use rshehe::{HeHeCore, interface::CtrlSignals};
    #[test]
    fn isatest_rv64ui_add(){
        let mut core = HeHeCore::new();
        core.load_elf("./isa/build/hex/rv64ui/add.hex");
        for _i in 0..3000{
            core.tik();
            if core.read_from_host() == 1{
                println!("======\ntest succ!\n======");
                return;
            }
            else if core.read_from_host() != 0{
                panic!("test fail @ {:x}", core.read_from_host());
            }
        }
        panic!("time limit reach");
    }
}

