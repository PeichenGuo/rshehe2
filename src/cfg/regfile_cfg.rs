use crate::cfg::core_cfg::*;

pub const APF_SIZE:usize = 32 + 1;
pub const CSRF_SIZE: usize = 4096;

lazy_static! {
    pub static  ref APF_MAPPING: Vec<String> = Vec::from([
        String::from("zero"),
        String::from("ra"),
        String::from("sp"),
        String::from("gp"),
        String::from("tp"),
        String::from("t0"),
        String::from("t1"),
        String::from("t2"),
        String::from("fp/s0"),
        String::from("s1"),
        String::from("a0"),
        String::from("a1"),
        String::from("a2"),
        String::from("a3"),
        String::from("a4"),
        String::from("a5"),
        String::from("a6"),
        String::from("a7"),
        String::from("s2"),
        String::from("s3"),
        String::from("s4"),
        String::from("s5"),
        String::from("s6"),
        String::from("s7"),
        String::from("s8"),
        String::from("s9"),
        String::from("s10"),
        String::from("s11"),
        String::from("t3"),
        String::from("t4"),
        String::from("t5"),
        String::from("t6"),
        String::from("pc"),
    ]);
}
   
pub const _MSTATUS_UIE_LOW: usize = 0;
pub const _MSTATUS_UIE: usize = 0x1;
pub const _MSTATUS_SIE_LOW: usize = 1;
pub const _MSTATUS_SIE: usize = 0x1 << _MSTATUS_SIE_LOW;
pub const _MSTATUS_MIE_LOW: usize = 3;
pub const _MSTATUS_MIE: usize = 0x1 << _MSTATUS_MIE_LOW;
 // 0_
pub const _MSTATUS_UPIE_LOW: usize = 4;
pub const _MSTATUS_UPIE: usize = 0x1 << _MSTATUS_UPIE_LOW;
pub const _MSTATUS_SPIE_LOW: usize = 5;
pub const _MSTATUS_SPIE: usize = 0x1 << _MSTATUS_SPIE_LOW;
 // 0_
pub const MSTATUS_MPIE_LOW: usize = 7;
pub const MSTATUS_MPIE: usize = 0x1 << MSTATUS_MPIE_LOW;
pub const _MSTATUS_SPP_LOW: usize = 8;
pub const _MSTATUS_SPP: usize = 0x1 << _MSTATUS_SPP_LOW;
 // 0_
pub const _MSTATUS_MPP_LOW: usize = 11;
pub const MSTATUS_MPP: usize = 0b11 << _MSTATUS_MPP_LOW;
pub const _MSTATUS_FS_LOW: usize = 13;
pub const _MSTATUS_FS: usize = 0b11 << _MSTATUS_FS_LOW;
pub const _MSTATUS_XS_LOW: usize = 15;
pub const _MSTATUS_XS: usize = 0b11 << _MSTATUS_XS_LOW;
pub const _MSTATUS_MPRV_LOW: usize = 17;
pub const _MSTATUS_MPRV: usize = 0b1 << _MSTATUS_MPRV_LOW;
pub const _MSTATUS_SUM_LOW: usize = 18;
pub const _MSTATUS_SUM: usize = 0b1 << _MSTATUS_SUM_LOW;
pub const _MSTATUS_MXR_LOW: usize = 19;
pub const _MSTATUS_MXR: usize = 0b1 << _MSTATUS_MXR_LOW;
pub const _MSTATUS_TVM_LOW: usize = 20;
pub const _MSTATUS_TVM: usize = 0b1 << _MSTATUS_TVM_LOW;
pub const _MSTATUS_TW_LOW: usize = 21;
pub const _MSTATUS_TW: usize = 0b1 << _MSTATUS_TW_LOW;
pub const _MSTATUS_TSR_LOW: usize = 22;
pub const _MSTATUS_TSR: usize = 0b1 << _MSTATUS_TSR_LOW;
 // 0_
pub const _MSTATUS_SD_LOW: usize = XLEN - 1;
pub const _MSTATUS_SD: usize = 0b1 << _MSTATUS_SD_LOW;

pub const _CSR_USTATUS_ADDRESS: u16 = 0x000;
pub const _CSR_FFLAGS_ADDRESS: u16 = 0x001;
pub const _CSR_FRM_ADDRESS: u16 = 0x002;
pub const _CSR_FCSR_ADDRESS: u16 = 0x003;
pub const _CSR_UIE_ADDRESS: u16 = 0x004;
pub const _CSR_UTVEC_ADDRESS: u16 = 0x005;
pub const _CSR_USCRATCH_ADDRESS: u16 = 0x040;
pub const _CSR_UEPC_ADDRESS: u16 = 0x041;
pub const _CSR_UCAUSE_ADDRESS: u16 = 0x042;
pub const _CSR_UTVAL_ADDRESS: u16 = 0x043;
pub const _CSR_UIP_ADDRESS: u16 = 0x044;
pub const _CSR_SSTATUS_ADDRESS: u16 = 0x100;
pub const _CSR_SEDELEG_ADDRESS: u16 = 0x102;
pub const _CSR_SIDELEG_ADDRESS: u16 = 0x103;
pub const _CSR_SIE_ADDRESS: u16 = 0x104;
pub const _CSR_STVEC_ADDRESS: u16 = 0x105;
pub const _CSR_SSCRATCH_ADDRESS: u16 = 0x140;
pub const _CSR_SEPC_ADDRESS: u16 = 0x141;
pub const _CSR_SCAUSE_ADDRESS: u16 = 0x142;
pub const _CSR_STVAL_ADDRESS: u16 = 0x143;
pub const _CSR_SIP_ADDRESS: u16 = 0x144;
pub const _CSR_SATP_ADDRESS: u16 = 0x180;
pub const CSR_MSTATUS_ADDRESS: u16 = 0x300;
pub const _CSR_MISA_ADDRESS: u16 = 0x301;
pub const _CSR_MEDELEG_ADDRESS: u16 = 0x302;
pub const _CSR_MIDELEG_ADDRESS: u16 = 0x303;
pub const _CSR_MIE_ADDRESS: u16 = 0x304;
pub const CSR_MTVEC_ADDRESS: u16 = 0x305;
pub const _CSR_MSCRATCH_ADDRESS: u16 = 0x340;
pub const CSR_MEPC_ADDRESS: u16 = 0x341;
pub const CSR_MCAUSE_ADDRESS: u16 = 0x342;
pub const _CSR_MTVAL_ADDRESS: u16 = 0x343;
pub const _CSR_MIP_ADDRESS: u16 = 0x344;
pub const _CSR_PMPCFG0_ADDRESS: u16 = 0x3a0;
pub const _CSR_PMPADDR0_ADDRESS: u16 = 0x3b0;
pub const _CSR_MCYCLE_ADDRESS: u16 = 0xb00;
pub const _CSR_CYCLE_ADDRESS: u16 = 0xc00;
pub const _CSR_TIME_ADDRESS: u16 = 0xc01;
pub const _CSR_INSERT_ADDRESS: u16 = 0xc02;
pub const _CSR_MHARTID_ADDRESS: u16 = 0xf14;

pub const _MIP_MEIP: u64 = 0x800;
pub const MIP_MTIP: u64 = 0x080;
pub const MIP_MSIP: u64 = 0x008;
pub const MIP_SEIP: u64 = 0x200;
pub const _MIP_STIP: u64 = 0x020;
pub const _MIP_SSIP: u64 = 0x002;


