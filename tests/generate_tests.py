import os
PROJ_ROOT = os.environ['PROJ_ROOT']
TEST_ROOT = os.environ['TEST_ROOT']
TESTS_PATH = f'{PROJ_ROOT}/{TEST_ROOT}'
ISATEST_PATH = f"{TESTS_PATH}/isa/build/hex"
TORTURE_PATH = f"{TESTS_PATH}/torture/build/hex"
BENCHMARK_DIR = f'{TESTS_PATH}/benchmark'
ISA_TEST_NAME = ['rv64um', 'rv64ui']


def FILE_HEADER(str):
    return f"""\
//////////////////////////////////////
//  Generated by generate_tests.py  //
//   filename: {str}    //
//          author: GPC             //
//////////////////////////////////////

#[cfg(test)] \
mod test {{
    use rshehe::{{HeHeCore, interface::CtrlSignals}}; 
    
"""

FILE_TAIL = f"""\n}} // test """

# ! isa test
for name in ISA_TEST_NAME:
    file_name = f'isatest_{name}.rs'
    testfile = open(TESTS_PATH + '/' + file_name, mode='w')
    testfile.write(FILE_HEADER(name))
    for filename in os.listdir(ISATEST_PATH + "/" + name):
        test = filename.split('.')[0]
        str = f"""\
        #[test]
        fn isatest_{name}_{test}(){{
            let mut core = HeHeCore::new();
            core.load_elf("{ISATEST_PATH}/{name}/{test}.hex");
            for _i in 0..3000{{
                core.tik();
                if core.read_from_host() == 1{{
                    println!("======test succ!======");
                    return;
                }}
                else if core.read_from_host() != 0{{
                    panic!("test fail @ {{:x}}", core.read_from_host());
                }}
            }}
            panic!("{name}_{test}: time limit reach");
        }}\n\n"""
        testfile.write(str)

    testfile.write(FILE_TAIL)
    testfile.close()


# ! torture
file_name = f'tourture_test.rs'
testfile = open(TESTS_PATH + '/' + file_name, mode='w')
testfile.write(FILE_HEADER(file_name))
for filename in os.listdir(TORTURE_PATH):
    if filename.find("test") == -1: continue
    test_name = filename.split('.')[0]
    str = f"""\
    #[test]
    fn torture_{test_name}(){{
        let mut core = HeHeCore::new();
        core.load_elf("{TORTURE_PATH}/{filename}");
        for _i in 0..1000000{{
            core.tik();
            if core.read_from_host() == 1{{
                println!("======test succ!======");
                return;
            }}
            else if core.read_from_host() != 0{{
                panic!("test fail @ {{:x}}", core.read_from_host());
            }}
        }}
        panic!("torture {test_name}: time limit reach");
    }}\n\n"""
    testfile.write(str)
    # break
testfile.write(FILE_TAIL)
testfile.close()

