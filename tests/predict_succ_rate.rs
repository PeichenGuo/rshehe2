#[cfg(test)] mod test {
    use rshehe::{HeHeCore, interface::CtrlSignals}; 
    use std::fs;
    #[test]
    fn predict_succ_rate_on_torture(){
        let mut core = HeHeCore::new();
        let mut succ_msg: String = String::from("predict_succ_rate_on_torture:\n=============================\n");
        for i in 1..101{
            core.rst(true);
            core.load_hex(format!("./tests/torture/build/hex/test{}.hex", i.to_string()).as_str());
            for _j in 0..1000000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    break
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            if core.read_from_host() != 1{
                panic!("torture test{}: time limit reach", i);
            }
            succ_msg.push_str(format!("torture test{}: {}\n", i, core.predict_succ_rate()).as_str());
        }
        fs::write("./predict_succ_rate_on_torture.txt", succ_msg).unwrap();
    }

    #[test]
    fn predict_succ_rate_on_loop(){
        let mut core = HeHeCore::new();
        let mut succ_msg: String = String::from("predict_succ_rate_on_loop:\n=============================\n");
        core.rst(true);
        core.load_hex(format!("./tests/selftest/build/hex/loop.hex").as_str());
        for _j in 0..100000{
            core.tik();
            if core.read_from_host() == 1{
                println!("======test succ!======");
                break
            }
            else if core.read_from_host() != 0{
                panic!("test fail @ {:x}", core.read_from_host());
            }
        }
        if core.read_from_host() != 1{
            panic!("loop test: time limit reach");
        }
        succ_msg.push_str(format!("loop test: {}\n", core.predict_succ_rate()).as_str());
        fs::write("./predict_succ_rate_on_loop.txt", succ_msg).unwrap();
    }
}