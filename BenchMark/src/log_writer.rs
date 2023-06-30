use std::fs::OpenOptions;
use std::io::prelude::*;

pub fn append_to_log_file(message: &str) {
    let file_path = "bench_mark.log";

    let mut file = OpenOptions::new()
        .create(true)
        .append(true)
        .open(file_path)
        .unwrap();

    writeln!(file, "{}", message).unwrap();
    file.flush().unwrap();
}
