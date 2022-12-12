#[derive(PartialEq)]
#[derive(Debug, Clone, Copy)]
// #[derive(Default)]
pub enum InstrType{
    R,
    I,
    S,
    B,
    U,
    J
} 
impl Default for InstrType {
    fn default() -> Self {
        InstrType::R
    }
}
#[derive(PartialEq)]
// #[deriving(Show)]
#[derive(Debug, Clone, Copy)]
// #[derive(Default)]
pub enum InstrOpcode{
    // * R
    ADD,
    SUB,
    SLL,
    SLT,
    SLTU,
    XOR,
    SRL,
    SRA,
    OR,
    AND,
    // rv64i
    ADDW,
    SUBW,
    SLLW,
    SRLW,
    SRAW,

    // m extension
    MUL,
    MULH,
    MULHSU,
    MULHU,
    DIV,
    DIVU,
    REM,
    REMU,
    // rv64i
    MULW,
    DIVW,
    DIVUW,
    REMW,
    REMUW,

    // * I
    JALR,

    LB,
    LH, 
    LW,
    LBU,
    LHU,
    // rv64i
    LWU,
    LD,

    ADDI,
    SLTI,
    SLTIU,
    XORI,
    ORI,
    ANDI,
    SLLI,
    SRLI,
    SRAI,
    // rv64i
    ADDIW,
    SLLIW,
    SRLIW,
    SRAIW,

    FENCE,
    FENCEI,

    ECALL,
    EBREAK,
    MRET,   
    
    CSRRW,
    CSRRS,
    CSRRC,
    CSRRWI,
    CSRRSI,
    CSRRCI,

    // * S
    SB,
    SH,
    SW,
    // rv64i
    SD,

    // * B
    BEQ,
    BNE,
    BLT,
    BGE,
    BLTU,
    BGEU,

    // * U
    LUI, 
    AUIPC,

    // * J
    JAL

}

impl Default for InstrOpcode {
    fn default() -> Self {
        InstrOpcode::ADD
    }
}