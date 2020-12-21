pub fn find(array: &[i32], key: i32) -> Option<usize> {
    if array.len() == 0 {
        return None;
    }
    let mut left = 0;
    let mut right = array.len() - 1;
    while left <= right {
        if right.checked_sub(1) == None {
            return None;
        }
        let mid = left + (right - 1) / 2;
        if mid >= array.len() {
            return None;
        }
        if array[mid] == key {
            return Some(mid);
        }
        if array[mid] < key {
            left = mid + 1;
        }
        if array[mid] > key {
            if mid.checked_sub(1) == None {
                return None;
            }
            right = mid - 1;
        }
    }
    None
}
