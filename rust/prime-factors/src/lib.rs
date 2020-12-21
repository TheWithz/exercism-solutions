pub fn factors(n: u64) -> Vec<u64> {
    let mut primes = Vec::new();
    let mut num = n;
    let mut x = 2;
    loop {
        if x == num {
            primes.push(x);
            break;
        }
        if num % x == 0 {
            primes.push(x);
            num = num / x;
            x = 2;
            continue;
        }
        x = x + 1;
    }
    primes
}
