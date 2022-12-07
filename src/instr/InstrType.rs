#[derive(Debug)]
#[derive(PartialEq)]
pub enum InstrType{
    R,
    I,
    S,
    B,
    U,
    J
} 
#[derive(Debug)]
#[derive(PartialEq)]
// #[deriving(Show)]
pub enum InstrOpcode{
    // R
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

    // I
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
    SLTIW,
    SLLIW,
    SRLIW,
    SRAIW,

    FENCE,
    FENCEI,
    ECALL,
    EBREAK,
    CSRRW,
    CSRRS,
    CSRRC,
    CSRRWI,
    CSRRSI,
    CSRRCI,

    // S
    SB,
    SH,
    SW,
    // rv64i
    SD,

    // B
    BEQ,
    BNE,
    BLT,
    BGE,
    BLTU,
    BGEU,

    // U
    LUI, 
    AUIPC,

    // J
    JAL

}