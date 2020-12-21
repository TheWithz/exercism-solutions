pub fn is_armstrong_number(num: u32) -> bool {
    // create vector of digits
    let digits: Vec<_> = num.to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap())
        .collect();
    // get length outside of loop to prevent borrow
    // pow expects u32 not usize
    let length: u32 = digits.len() as u32;
    let mut sum = 0;
    for digit in digits {
        sum += digit.pow(length);
    }
    sum == num
}
