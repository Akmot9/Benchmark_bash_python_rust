use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let count_to: u32 = args[1].parse().unwrap();
    let mut result: u32 = 0;

    for _ in 1..=count_to {
        result += 1;
        println!("{}", result);
    }

    println!("Counting completed.");
    println!("Result: {}", result);
}



