use std::vec::Vec;

fn main() {
    let file_paths: Vec<&str> = vec![
        "./Count/bash/countPrint/main_v2.sh",
        "./Count/bash/CountBg/main_v2.sh",
        "./Count/python/countPrint/main_v2.py",
        "./Count/python/CountBg/main_v2.py",
        "./Count/rust/count_print/target/debug/count_print",
        "./Count/rust/count_bg/target/debug/count_bg",
    ];

    for path in file_paths {
        println!("{}", path);
    }
}