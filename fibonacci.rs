use std::time::Instant;

fn fib(n: i32) -> i32{
    if n < 3 {
        return 1;
    } else {
        return fib(n-1) + fib(n-2);
    }
}

fn main() {
    let start = Instant::now();
    let n = 40;
    let res = fib(n);
    println!("fib({}) = {}", n, res);

    let time = start.elapsed();
    println!("time elapsed = {:.2?}", time);
}