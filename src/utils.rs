use std::cell::{RefCell,  RefMut};
pub fn ref_cell_borrow_mut<'a, T>(ref_cell: &'a RefCell<T>) -> RefMut<'a, T> {
    ref_cell.borrow_mut()
}