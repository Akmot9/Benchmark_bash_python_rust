use std::fs::File;
use std::io::{self, Write};
use std::time::Instant;
use walkdir::WalkDir;

fn list_files_recursive(directory: &str, output_file: &str, log_file: &str) -> io::Result<()> {
    let start_time = Instant::now();

    let file = File::create(output_file)?;
    let mut writer = io::BufWriter::new(file);

    let log_file = File::create(log_file)?;
    let mut log_writer = io::BufWriter::new(log_file);

    for entry in WalkDir::new(directory).follow_links(true) {
        match entry {
            Ok(entry) => {
                if entry.file_type().is_file() {
                    if let Some(path) = entry.path().to_str() {
                        writeln!(writer, "{}", path)?;
                    }
                }
            }
            Err(error) => {
                if let Some(path) = error.path() {
                    if let Some(path_str) = path.to_str() {
                        writeln!(log_writer, "Error accessing file: {}", path_str)?;
                    }
                }
            }
        }
    }

    let elapsed_time = start_time.elapsed().as_secs_f64();
    writeln!(log_writer, "Execution time: {:.2} seconds", elapsed_time)?;

    Ok(())
}

fn main() {
    let directory = "/home/akmot/Documents/GitHub/Benchmark_bash_python_rust";
    let output_file = "files_rust.txt";
    let log_file = "list_files_log.log";

    match list_files_recursive(directory, output_file, log_file) {
        Ok(_) => println!("List of regular files written to {}.", output_file),
        Err(error) => eprintln!("Error: {}", error),
    }
}
