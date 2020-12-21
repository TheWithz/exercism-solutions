use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut mults = HashSet::new(); // don't count duplicate multiples
    let mut sum = 0;
    // filter out 0 so we don't loop forever
    for factor in factors.into_iter().filter(|f| **f != 0) {
        let mut temp: u32 = *factor;
        while temp < limit {
            mults.insert(temp);
            temp += *factor;
        }
    }
    for multiple in mults {
        sum += multiple;
    }
    sum
}
