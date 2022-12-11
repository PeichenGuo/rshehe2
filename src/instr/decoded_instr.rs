
use crate::instr::intsr_type::*;
#[derive(Default, Debug, PartialEq, Clone)]
pub struct DecodedInstr{
    pub opcode: u8,
    pub rd:u8,
    pub funct3:u8,
    pub rs1:u8,
    pub rs2:u8,
    pub funct7:u8,
    pub immi:u16,
    pub imms:u16,
    pub immb:u16,
    pub immu:u32,
    pub immj:u32,
    pub shamt:u8,
    pub csr: u16,
    pub zimm:u8,

    pub instr_type: InstrType,
    pub opcode_type: InstrOpcode,

    pub is_ld: bool,
    pub is_st: bool,
    pub is_alu: bool,
    pub is_branch: bool,
    pub is_fence: bool,
    pub is_csr:bool,
    pub is_syscall:bool,

    pub illegale_instr: bool,
    pub msg: String,
}

impl DecodedInstr{
    pub fn new(raw: u32) -> Self{
        let opcode = (raw & 0x7f) as u8; // [6:0]
        let rd:u8 = ((raw >> 7) & 0x1f) as u8; // 11:7
        let funct3: u8 = ((raw >> 12) & 0x7) as u8; // [14:12]
        let rs1: u8 = ((raw >> 15) & 0x1f) as u8; // [19:15]
        let rs2: u8 = ((raw >> 20) & 0x1f) as u8; // [24:20]
        let funct7: u8 = ((raw >> 25) & 0x7f) as u8; // [31:25]
        let immi:u16 = (((funct7 as u16) << 5) + rs2 as u16) & 0xfff;
        let imms:u16 = (((funct7 as u16) << 5) + rd as u16) & 0xfff;
        let immb:u16 =  ((((raw >> 31) & 0x1) as u16) << 12) + // imm[12]
                        ((((raw >> 7) & 0x1) as u16) << 11) + // imm[11]
                        ((((raw >> 25) & 0x3f) as u16) << 5) + // imm[10:5]
                        ((((raw >> 8) & 0xf) as u16) << 1); // imm[4:1]  
        let immu:u32 = raw & 0xffff_f000; // imm[31:12]
        let immj:u32 =  (((raw >> 31) & 0x1) << 20) + // imm[20]
                        (((raw >> 12) & 0xff) << 12) + // imm[19:12]
                        (((raw >> 20) & 0x1) << 11) + // imm[11]
                        (((raw >> 21) & 0x3ff) << 1); // imm[10:1]     
        let shamt: u8 = ((raw >> 20) & 0x3f) as u8;
        let csr: u16 = ((raw >> 20) & 0xfff) as u16;
        let zimm: u8 = ((raw >> 15) & 0x1f) as u8;
        let mut illegle_instr: bool = false;
        let mut msg: String = String::from("");
        if raw == 0x73{
            println!("ecall : opcode:{:07b} funct3:{:03b} funct7:{:07b} immi:{:012b}, rs2:{:05b}", opcode, funct3, funct7, immi, rs2);
        }
        let instr_type = match opcode{
            // rv32i
            0b0110111 | 0b0010111=> InstrType::U,
            0b1101111 => InstrType::J,
            0b1100011 => InstrType::B,
            0b1100111 | 0b0000011 | 0b0010011 | 0b0001111 | 0b1110011 | 0b0011011 => InstrType::I,
            0b0100011 => InstrType::S,
            0b0110011 | 0b0111011 => InstrType::R,

            // rv64i
            // no new opcode

            // illegal cases
            _ => {
                // panic!("illegal instruction opcode: {:07b}", opcode);
                msg = String::from(format!("illegal instruction opcode: {:07b}", opcode));
                illegle_instr = true;
                Default::default()
            }
        };

        let opcode_type = match instr_type{
            // rv32i
            InstrType::U => {
                match opcode{
                    0b0110111 => InstrOpcode::LUI,
                    0b0010111 => InstrOpcode::AUIPC,
                    _ => {
                        // panic!("illegale opcode {:07b} while opcode is InstrU", opcode)
                        msg = String::from(format!("illegale opcode {:07b} while opcode is InstrU", opcode));
                        illegle_instr = true;
                        Default::default()
                    }
                }
            },
            InstrType::J => InstrOpcode::JAL,
            InstrType::B => match funct3{
                0b000 => InstrOpcode::BEQ,
                0b001 => InstrOpcode::BNE,
                0b100 => InstrOpcode::BLT,
                0b101 => InstrOpcode::BGE,
                0b110 => InstrOpcode::BLTU,
                0b111 => InstrOpcode::BGEU,
                _ => {
                    // panic!("illegale functs3 {:03b} while opcode is InstrB", funct3)
                    illegle_instr = true;
                    msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrB", funct3));
                    Default::default()
                }
            },
            InstrType::I => match opcode {
                0b1100111 => InstrOpcode::JALR,
                0b0000011 => match funct3{ // load 
                    0b000 => InstrOpcode::LB,
                    0b100 => InstrOpcode::LBU,
                    0b001 => InstrOpcode::LH,
                    0b101 => InstrOpcode::LHU,
                    0b010 => InstrOpcode::LW,
                    // rv64i
                    0b110 => InstrOpcode::LWU,
                    0b011 => InstrOpcode::LD,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (load)", funct3)      
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (load)", funct3));
                        Default::default()
                    }
                }
                0b0010011 => match funct3{ // alu
                    0b000 => InstrOpcode::ADDI,
                    0b010 => InstrOpcode::SLTI,
                    0b011 => InstrOpcode::SLTIU,
                    0b100 => InstrOpcode::XORI,
                    0b110 => InstrOpcode::ORI,
                    0b111 => InstrOpcode::ANDI,
                    0b001 => match funct7 >> 1{
                        0b000000 => InstrOpcode::SLLI,
                        _ => {
                            // panic!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 001 (shift left)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 001 (shift left)", funct7));
                            Default::default()
                        }
                    },
                    0b101 => match funct7 >> 1{
                        0b000000 => InstrOpcode::SRLI,
                        0b010000 => InstrOpcode::SRAI,
                        _ => { 
                            // panic!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 101 (shift right)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 101 (shift right)", funct7));
                            Default::default()
                        }
                    },
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (alu)", funct3)
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (alu)", funct3));
                        Default::default()
                    }      
                }
                0b0001111 => match funct3{ // FENCE
                    0b000 => InstrOpcode::FENCE,
                    0b001 => InstrOpcode::FENCEI,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (InstrI fence)", funct3)   
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (InstrI fence)", funct3));
                        Default::default()
                    }   
                },
                0b1110011 => match funct3{ // s
                    0b000 => match  immi{ // system call
                        0b000000000000 => {
                            println!("ecall decoded");
                            InstrOpcode::ECALL
                        },
                        0b000000000001 => InstrOpcode::EBREAK,
                        0b001100000010 => InstrOpcode::MRET,
                        _=> {
                            // panic!("illegale immi {:012b} while opcode is InstrI-1110011 (s) and funct3 is 000 (sys call)", immi);
                            illegle_instr = true;
                            msg = String::from(format!("illegale immi {:012b} while opcode is InstrI-1110011 (s) and funct3 is 000 (sys call)", immi));
                            Default::default()
                        }
                    }
                    0b001 => InstrOpcode::CSRRW,
                    0b010 => InstrOpcode::CSRRS,
                    0b011 => InstrOpcode::CSRRC,
                    0b101 => InstrOpcode::CSRRWI,
                    0b110 => InstrOpcode::CSRRSI,
                    0b111 => InstrOpcode::CSRRCI,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (InstrI s)", funct3) 
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (InstrI s)", funct3));
                        Default::default()
                    }     
                },
                0b0011011 => match funct3 { // iw
                    0b000 => InstrOpcode::ADDIW,
                    0b001 => InstrOpcode::SLLIW,
                    0b101 => match funct7 >> 1{
                        0b000000 => InstrOpcode::SRLIW,
                        0b010000 => InstrOpcode::SRAIW,
                        _ => {
                            // panic!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 101 (shift right w)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 101 (shift right w)", funct7));
                            Default::default()
                        }
                    },
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (iw)", funct3)    
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (iw)", funct3));
                        Default::default()
                    }  
                },
                _ => {
                    // panic!("should not happened, add panic anyway")
                    illegle_instr = true;
                    msg = String::from(format!("illegal funct7 {:07b} while opcode is InstrI", funct7));
                    Default::default()
                }
            },
            InstrType::R => match opcode {
                0b0110011 => match funct3 {
                    0b000 => match funct7 {
                        0b0000000 => InstrOpcode::ADD,
                        0b0100000 => InstrOpcode::SUB,
                        _ => {
                            // panic!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub)", funct7));
                            Default::default()
                        }
                    },
                    0b001 => InstrOpcode::SLL,
                    0b010 => InstrOpcode::SLT,
                    0b011 => InstrOpcode::SLTU,
                    0b100 => InstrOpcode::XOR,
                    0b101 => match funct7 >> 1{
                        0b000000 => InstrOpcode::SRL,
                        0b010000 => InstrOpcode::SRA,
                        _ => {
                            // panic!("illegale functs7 {:07b} while opcode is InstrR  and funct3 is 101 (shift right)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrR  and funct3 is 101 (shift right)", funct7));
                            Default::default()
                        }
                    },
                    0b110 => InstrOpcode::OR,
                    0b111 => InstrOpcode::AND,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrR (alu)", funct3)  
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrR (alu)", funct3));
                        Default::default()
                    }    
                },
                0b0111011 => match funct3{ // rv64i
                    0b000 => match funct7 {
                        0b0000000 => InstrOpcode::ADDW,
                        0b0100000 => InstrOpcode::SUBW,
                        _ => {
                            // panic!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub rv64i)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub rv64i)", funct7));
                            Default::default()
                        }
                    },
                    0b001 => InstrOpcode::SLLW,
                    0b101 => match funct7 >> 1{
                        0b000000 => InstrOpcode::SRLW,
                        0b010000 => InstrOpcode::SRAW,
                        _ => {
                            // panic!("illegale functs7 {:07b} while opcode is InstrR and funct3 is 101 (shift right rv64i)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrR and funct3 is 101 (shift right rv64i)", funct7));
                            Default::default()
                        }
                    },
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrR (rv64i)", funct3) 
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrR (rv64i)", funct3));
                        Default::default()
                    }
                },
                _ => {
                    illegle_instr = true;
                    msg = String::from(format!("illegale opcode {:07b} while opcode is InstrR ", opcode));
                    Default::default()
                }
            }
            
            InstrType::S => match funct3 {
                0b000 => InstrOpcode::SB,
                0b001 => InstrOpcode::SH,
                0b010 => InstrOpcode::SW,
                // rv64i
                0b011 => InstrOpcode::SD,
                _ => {
                    // panic!("illegale functs3 {:03b} while opcode is InstrS ", funct3) 
                    illegle_instr = true;
                    msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrS ", funct3));
                    Default::default()
                }     
            },
        };

        let is_st = instr_type == InstrType::S;
        let is_ld = (opcode_type == InstrOpcode::LB) || (opcode_type == InstrOpcode::LBU) || 
                        (opcode_type == InstrOpcode::LH) || (opcode_type == InstrOpcode::LHU) ||
                        (opcode_type == InstrOpcode::LW) || (opcode_type == InstrOpcode::LWU) ||
                        (opcode_type == InstrOpcode::LD);
        let is_alu = 
            (opcode_type == InstrOpcode::ADD) || (opcode_type == InstrOpcode::SUB) || 
            (opcode_type == InstrOpcode::SLL) || (opcode_type == InstrOpcode::SLT) || 
            (opcode_type == InstrOpcode::SLTU) || (opcode_type == InstrOpcode::XOR) || 
            (opcode_type == InstrOpcode::SRL) || (opcode_type == InstrOpcode::SRA) || 
            (opcode_type == InstrOpcode::OR) || (opcode_type == InstrOpcode::AND) || 
            (opcode_type == InstrOpcode::ADDW) || (opcode_type == InstrOpcode::SUBW) || 
            (opcode_type == InstrOpcode::SLLW) || (opcode_type == InstrOpcode::SRLW) || 
            (opcode_type == InstrOpcode::SRAW) || (opcode_type == InstrOpcode::ADDI) || 
            (opcode_type == InstrOpcode::SLTI) || (opcode_type == InstrOpcode::SLTIU) || 
            (opcode_type == InstrOpcode::XORI) || (opcode_type == InstrOpcode::ORI) || 
            (opcode_type == InstrOpcode::ANDI) || (opcode_type == InstrOpcode::SLLI) || 
            (opcode_type == InstrOpcode::SRLI) || (opcode_type == InstrOpcode::SRAI) || 
            (opcode_type == InstrOpcode::ADDIW) || 
            (opcode_type == InstrOpcode::SLLIW) || (opcode_type == InstrOpcode::SRLIW) || 
            (opcode_type == InstrOpcode::SRAIW) ||  
            (opcode_type == InstrOpcode::AUIPC) || (opcode_type == InstrOpcode::LUI);
        let is_branch = instr_type == InstrType::B || instr_type == InstrType::J ||
                                opcode_type == InstrOpcode::JALR;
        let is_fence = opcode_type == InstrOpcode::FENCE || opcode_type == InstrOpcode::FENCEI;
        let is_csr = 
            (opcode_type == InstrOpcode::CSRRW) || (opcode_type == InstrOpcode::CSRRS) || 
            (opcode_type == InstrOpcode::CSRRC) || (opcode_type == InstrOpcode::CSRRWI) || 
            (opcode_type == InstrOpcode::CSRRSI) || (opcode_type == InstrOpcode::CSRRCI);
        let is_syscall = 
            (opcode_type == InstrOpcode::ECALL) || (opcode_type == InstrOpcode::EBREAK) || 
            (opcode_type == InstrOpcode::MRET);

        DecodedInstr { 
            opcode: opcode, 
            rd: rd, 
            funct3: funct3, 
            rs1: rs1, 
            rs2: rs2, 
            funct7: funct7, 
            immi: immi, 
            imms: imms, 
            immb: immb, 
            immu: immu, 
            immj: immj,
            shamt: shamt,
            csr:csr,
            zimm:zimm,
            instr_type: instr_type, 
            opcode_type: opcode_type,
            is_ld: is_ld,
            is_st: is_st,
            is_alu: is_alu,
            is_branch: is_branch,
            is_fence: is_fence,
            is_csr:is_csr,
            is_syscall:is_syscall,

            illegale_instr:illegle_instr,
            msg:msg
        }
    }
}

#[cfg(test)]
mod test{
    use crate::instr::decoded_instr::*;

    #[test]
    fn basic_decoded_instr_test_on_add_hex(){
        // 0000000:	05c0006f          	j	8000005c <reset_vector>
        let instr = DecodedInstr::new(0x05c0006f);
        assert_eq!(instr.instr_type, InstrType::J);
        assert_eq!(instr.opcode_type, InstrOpcode::JAL);
        assert_eq!(instr.immj, (0x8000005c & 0x1fffe));
        assert!(instr.is_branch);

        // 800000dc:	00051063          	bnez	a0,800000dc <reset_vector+0x80>
        let instr = DecodedInstr::new(0x00051063);
        assert_eq!(instr.opcode_type, InstrOpcode::BNE);
        assert_eq!(instr.rs1, 10);
        assert_eq!(instr.rs2, 0);
        assert_eq!(instr.immb, 0);
        assert!(instr.is_branch);

        // 80000144:	00055c63          	bgez	a0,8000015c <reset_vector+0x100>
        let instr = DecodedInstr::new(0x00055c63);
        assert_eq!(instr.opcode_type, InstrOpcode::BGE);
        assert_eq!(instr.rs1, 10);
        assert_eq!(instr.rs2, 0);
        assert_eq!(instr.immb, (0x015c - 0x0144) & 0x1ffe);
        assert!(instr.is_branch);

        // 800000d8:	f1402573          	csrr	a0,mhartid
        // 把控制状态寄存器 csr 的值写入 x[rd]，等同于 csrrs rd, csr, x0.
        let instr = DecodedInstr::new(0xf1402573);
        assert_eq!(instr.opcode_type, InstrOpcode::CSRRS);
        assert!(instr.is_csr);

        let instr = DecodedInstr::new(0x0012829b);
        assert_eq!(instr.opcode_type, InstrOpcode::ADDIW);
        assert!(instr.is_alu);

    }
}