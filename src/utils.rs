use std::cell::{RefCell,  RefMut};
pub fn ref_cell_borrow_mut<'a, T>(ref_cell: &'a RefCell<T>) -> RefMut<'a, T> {
    ref_cell.borrow_mut()
}
pub fn signed_less_than(a: u64, b:u64) -> bool{
    if (a >> 63) == 1 && (b >> 63) == 1 {
        (a << 1) > (b << 1)
    }
    else if (a >> 63) == 0 && (b >> 63) == 0 {
        (a << 1) < (b << 1)
    }
    else if (a >> 63) == 0 && (b >> 63) == 0{
        true
    }
    else{
        false
    }
}

pub fn sext(a:u64, sign_bit: usize) -> u64{

    if(a >> sign_bit) & 0x1 == 0x1{
        (a as u64) | 0xffff_ffff_ffff_ffff <<  sign_bit
    }
    else{
        a & (0xffff_ffff_ffff_ffff >> (63 - sign_bit)) // clear top
    }
}

pub fn sra64(a:u64, b:u64) -> u64 {
    if (a >> 63) == 1{
        (a >> b) | (0xffff_ffff_ffff_ffff << (63 - b))
    }
    else{
        a >> b
    }
}

pub fn sra32(a:u32, b:u32) -> u32 {
    if (a >> 31) == 1{
        (a >> b) | (0xffff_ffff << (31 - b))
    }
    else{
        a >> b
    }
}

// pub fn sign_extend_32_64(a: u32) -> u64{
//     if(a >> 31) == 1{
//         (a as u64) | 0xffff_ffff_0000_0000 
//     }else{
//         a as u64
//     }
// }

