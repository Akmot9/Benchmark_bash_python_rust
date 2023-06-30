mod functions;
mod log_writer;
use functions::execute_process;
use log_writer::append_to_log_file;

fn main() {
    let file_paths: Vec<&str> = vec![
        "./Count/bash/countPrint/main_v2.sh",
        "./Count/bash/CountBg/main_v2.sh",
        "./Count/python/countPrint/main_v2.py",
        "./Count/python/CountBg/main_v2.py",
        "./Count/rust/count_print/target/debug/count_print",
        "./Count/rust/count_bg/target/debug/count_bg",
    ];

    let argument_value = 2; // Example integer argument value
    append_to_log_file("FICHIER DE LOG") ;
    for path in file_paths {
        execute_process(path, argument_value);
    }
}
