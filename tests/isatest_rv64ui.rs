//////////////////////////////////////
//  Generated by generate_tests.py  //
//   filename: rv64ui    //
//          author: GPC             //
//////////////////////////////////////

#[cfg(test)] mod test {
    use rshehe::{HeHeCore, interface::CtrlSignals}; 
    
        #[test]
        fn isatest_rv64ui_bgeu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/bgeu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_bgeu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sb(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sb.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sb: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_addi(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/addi.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_addi: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sra(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sra.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sra: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_and(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/and.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_and: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_slli(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/slli.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_slli: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_bltu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/bltu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_bltu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_subw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/subw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_subw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sd(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sd.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sd: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_slti(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/slti.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_slti: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sraiw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sraiw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sraiw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_beq(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/beq.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_beq: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_xor(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/xor.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_xor: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lb(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lb.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lb: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_add(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/add.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_add: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_bne(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/bne.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_bne: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_srai(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/srai.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_srai: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_ld(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/ld.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_ld: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_slt(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/slt.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_slt: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sub(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sub.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sub: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_srli(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/srli.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_srli: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sll(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sll.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sll: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lwu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lwu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lwu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lbu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lbu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lbu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lh(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lh.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lh: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_srliw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/srliw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_srliw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sltiu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sltiu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sltiu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sraw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sraw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sraw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lui(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lui.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lui: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_or(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/or.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_or: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_auipc(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/auipc.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_auipc: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_ori(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/ori.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_ori: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_jal(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/jal.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_jal: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_blt(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/blt.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_blt: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_srlw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/srlw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_srlw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_slliw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/slliw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_slliw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_simple(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/simple.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_simple: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_lhu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/lhu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_lhu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_addw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/addw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_addw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sllw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sllw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sllw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_andi(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/andi.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_andi: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_jalr(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/jalr.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_jalr: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sh(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sh.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sh: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_bge(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/bge.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_bge: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_sltu(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/sltu.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_sltu: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_xori(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/xori.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_xori: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_addiw(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/addiw.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_addiw: time limit reach");
        }

        #[test]
        fn isatest_rv64ui_srl(){
            let mut core = HeHeCore::new();
            core.load_hex("./tests/isa/build/hex/rv64ui/srl.hex");
            for _i in 0..3000{
                core.tik();
                if core.read_from_host() == 1{
                    println!("======test succ!======");
                    return;
                }
                else if core.read_from_host() != 0{
                    panic!("test fail @ {:x}", core.read_from_host());
                }
            }
            panic!("rv64ui_srl: time limit reach");
        }


} // test 