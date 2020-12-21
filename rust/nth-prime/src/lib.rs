pub fn nth(n: u32) -> u32 {
   let primes: Vec<u32> = (2u32..1_000_000u32).filter(|x| is_prime(*x)).collect();
   primes[n as usize]
}

fn is_prime(n: u32) -> bool {
    for i in (2..=n).take_while(|&x| x * x <= n) {
        if n % i == 0 {
            return false;
        }
    }
    return true;
}
