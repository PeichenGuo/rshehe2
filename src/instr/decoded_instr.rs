
use crate::instr::intsr_type::{*, InstrOpcode::*};
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
    pub is_mul: bool,
    pub is_branch: bool,
    pub is_fence: bool,
    pub is_csr:bool,
    pub csr_we: bool,
    pub csr_re: bool, 
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
                    0b0110111 => LUI,
                    0b0010111 => AUIPC,
                    _ => {
                        // panic!("illegale opcode {:07b} while opcode is InstrU", opcode)
                        msg = String::from(format!("illegale opcode {:07b} while opcode is InstrU", opcode));
                        illegle_instr = true;
                        Default::default()
                    }
                }
            },
            InstrType::J => JAL,
            InstrType::B => match funct3{
                0b000 => BEQ,
                0b001 => BNE,
                0b100 => BLT,
                0b101 => BGE,
                0b110 => BLTU,
                0b111 => BGEU,
                _ => {
                    // panic!("illegale functs3 {:03b} while opcode is InstrB", funct3)
                    illegle_instr = true;
                    msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrB", funct3));
                    Default::default()
                }
            },
            InstrType::I => match opcode {
                0b1100111 => JALR,
                0b0000011 => match funct3{ // load 
                    0b000 => LB,
                    0b100 => LBU,
                    0b001 => LH,
                    0b101 => LHU,
                    0b010 => LW,
                    // rv64i
                    0b110 => LWU,
                    0b011 => LD,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (load)", funct3)      
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (load)", funct3));
                        Default::default()
                    }
                }
                0b0010011 => match funct3{ // alu
                    0b000 => ADDI,
                    0b010 => SLTI,
                    0b011 => SLTIU,
                    0b100 => XORI,
                    0b110 => ORI,
                    0b111 => ANDI,
                    0b001 => match funct7 >> 1{
                        0b000000 => SLLI,
                        _ => {
                            // panic!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 001 (shift left)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrI and funct3 is 001 (shift left)", funct7));
                            Default::default()
                        }
                    },
                    0b101 => match funct7 >> 1{
                        0b000000 => SRLI,
                        0b010000 => SRAI,
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
                    0b000 => FENCE,
                    0b001 => FENCEI,
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
                            ECALL
                        },
                        0b000000000001 => EBREAK,
                        0b001100000010 => MRET,
                        _=> {
                            // panic!("illegale immi {:012b} while opcode is InstrI-1110011 (s) and funct3 is 000 (sys call)", immi);
                            illegle_instr = true;
                            msg = String::from(format!("illegale immi {:012b} while opcode is InstrI-1110011 (s) and funct3 is 000 (sys call)", immi));
                            Default::default()
                        }
                    }
                    0b001 => CSRRW,
                    0b010 => CSRRS,
                    0b011 => CSRRC,
                    0b101 => CSRRWI,
                    0b110 => CSRRSI,
                    0b111 => CSRRCI,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrI (InstrI s)", funct3) 
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrI (InstrI s)", funct3));
                        Default::default()
                    }     
                },
                0b0011011 => match funct3 { // iw
                    0b000 => ADDIW,
                    0b001 => SLLIW,
                    0b101 => match funct7 >> 1{
                        0b000000 => SRLIW,
                        0b010000 => SRAIW,
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
                        0b0000000 => ADD,
                        0b0100000 => SUB,
                        0b0000001 => match funct3 {
                            0b000 => MUL,
                            0b001 => MULH,
                            0b010 => MULHSU,
                            0b011 => MULHU,
                            0b100 => DIV,
                            0b101 => DIVU,
                            0b110 => REM,
                            0b111 => REMU,
                            _ => panic!("should not panic.")
                        },
                        _ => {
                            // panic!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub)", funct7));
                            Default::default()
                        }
                    },
                    0b001 => SLL,
                    0b010 => SLT,
                    0b011 => SLTU,
                    0b100 => XOR,
                    0b101 => match funct7 >> 1{
                        0b000000 => SRL,
                        0b010000 => SRA,
                        _ => {
                            // panic!("illegale functs7 {:07b} while opcode is InstrR  and funct3 is 101 (shift right)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while opcode is InstrR  and funct3 is 101 (shift right)", funct7));
                            Default::default()
                        }
                    },
                    0b110 => OR,
                    0b111 => AND,
                    _ => {
                        // panic!("illegale functs3 {:03b} while opcode is InstrR (alu)", funct3)  
                        illegle_instr = true;
                        msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrR (alu)", funct3));
                        Default::default()
                    }    
                },
                0b0111011 => match funct3{ // rv64i
                    0b000 => match funct7 {
                        0b0000000 => ADDW,
                        0b0100000 => SUBW,
                        0b0000001 => match funct3 {
                            0b000 => MULW,
                            0b100 => DIVW,
                            0b101 => DIVUW,
                            0b110 => REMW,
                            0b111 => REMUW,
                            _ => panic!("should not panic.")
                        },
                        _ => {
                            // panic!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub rv64i)", funct7)
                            illegle_instr = true;
                            msg = String::from(format!("illegale functs7 {:07b} while InstrR (InstrI-alu) and funct3 is 000 (add and sub rv64i)", funct7));
                            Default::default()
                        }
                    },
                    0b001 => SLLW,
                    0b101 => match funct7 >> 1{
                        0b000000 => SRLW,
                        0b010000 => SRAW,
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
                0b000 => SB,
                0b001 => SH,
                0b010 => SW,
                // rv64i
                0b011 => SD,
                _ => {
                    // panic!("illegale functs3 {:03b} while opcode is InstrS ", funct3) 
                    illegle_instr = true;
                    msg = String::from(format!("illegale functs3 {:03b} while opcode is InstrS ", funct3));
                    Default::default()
                }     
            },
        };

        let is_st = instr_type == InstrType::S;
        let is_ld = (opcode_type == LB) || (opcode_type == LBU) || 
                        (opcode_type == LH) || (opcode_type == LHU) ||
                        (opcode_type == LW) || (opcode_type == LWU) ||
                        (opcode_type == LD);
        let is_alu = 
            (opcode_type == ADD) || (opcode_type == SUB) || 
            (opcode_type == SLL) || (opcode_type == SLT) || 
            (opcode_type == SLTU) || (opcode_type == XOR) || 
            (opcode_type == SRL) || (opcode_type == SRA) || 
            (opcode_type == OR) || (opcode_type == AND) || 
            (opcode_type == ADDW) || (opcode_type == SUBW) || 
            (opcode_type == SLLW) || (opcode_type == SRLW) || 
            (opcode_type == SRAW) || (opcode_type == ADDI) || 
            (opcode_type == SLTI) || (opcode_type == SLTIU) || 
            (opcode_type == XORI) || (opcode_type == ORI) || 
            (opcode_type == ANDI) || (opcode_type == SLLI) || 
            (opcode_type == SRLI) || (opcode_type == SRAI) || 
            (opcode_type == ADDIW) || 
            (opcode_type == SLLIW) || (opcode_type == SRLIW) || 
            (opcode_type == SRAIW) ||  
            (opcode_type == AUIPC) || (opcode_type == LUI);
        let is_mul = 
            (opcode_type == MUL) || (opcode_type == MULH) || 
            (opcode_type == MULHSU) || (opcode_type == MULHU) || 
            (opcode_type == DIV) || (opcode_type == DIVU) || 
            (opcode_type == REM) || (opcode_type == REMU);
        let is_branch = instr_type == InstrType::B || instr_type == InstrType::J ||
                                opcode_type == JALR;
        let is_fence = opcode_type == FENCE || opcode_type == FENCEI;
        let is_csr = 
            (opcode_type == CSRRW) || (opcode_type == CSRRS) || 
            (opcode_type == CSRRC) || (opcode_type == CSRRWI) || 
            (opcode_type == CSRRSI) || (opcode_type == CSRRCI);
        let is_syscall = 
            (opcode_type == ECALL) || (opcode_type == EBREAK) || 
            (opcode_type == MRET);
        let (csr_re, csr_we): (bool, bool) = match opcode_type{
            CSRRW | CSRRWI => (rd != 0, true),
            CSRRC | CSRRCI | CSRRS | CSRRSI => (true, rs1 != 0),
            _ => {
                (false, false)
            }
        };
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
            is_mul:is_mul,
            is_branch: is_branch,
            is_fence: is_fence,
            is_csr:is_csr,
            csr_re:csr_re,
            csr_we:csr_we,
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
        assert_eq!(instr.opcode_type, JAL);
        assert_eq!(instr.immj, (0x8000005c & 0x1fffe));
        assert!(instr.is_branch);

        // 800000dc:	00051063          	bnez	a0,800000dc <reset_vector+0x80>
        let instr = DecodedInstr::new(0x00051063);
        assert_eq!(instr.opcode_type, BNE);
        assert_eq!(instr.rs1, 10);
        assert_eq!(instr.rs2, 0);
        assert_eq!(instr.immb, 0);
        assert!(instr.is_branch);

        // 80000144:	00055c63          	bgez	a0,8000015c <reset_vector+0x100>
        let instr = DecodedInstr::new(0x00055c63);
        assert_eq!(instr.opcode_type, BGE);
        assert_eq!(instr.rs1, 10);
        assert_eq!(instr.rs2, 0);
        assert_eq!(instr.immb, (0x015c - 0x0144) & 0x1ffe);
        assert!(instr.is_branch);

        // 800000d8:	f1402573          	csrr	a0,mhartid
        // 把控制状态寄存器 csr 的值写入 x[rd]，等同于 csrrs rd, csr, x0.
        let instr = DecodedInstr::new(0xf1402573);
        assert_eq!(instr.opcode_type, CSRRS);
        assert!(instr.is_csr);

        let instr = DecodedInstr::new(0x0012829b);
        assert_eq!(instr.opcode_type, ADDIW);
        assert!(instr.is_alu);

    }
}