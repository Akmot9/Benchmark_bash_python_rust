use std::fs::{self, File};
use std::io::Write;
use std::os::unix::fs::MetadataExt;

fn list_files(start_path: &str) {
    let ignore_dirs = ["/dev", "/proc", "/run", "/sys"];
    let mut file = File::create("resultat.txt").expect("Unable to create file");

    for entry in fs::read_dir(start_path).expect("Unable to read directory") {
        let entry = entry.expect("Unable to get directory entry");
        let path = entry.path();

        let metadata = entry.metadata().expect("Unable to read metadata");

        if metadata.file_type().is_symlink() {
            continue;
        }

        if path.is_dir() {
            if ignore_dirs.contains(&path.to_str().unwrap()) {
                continue;
            }

            list_files(&path.to_string_lossy());
        } else {
            let file_path = path.to_string_lossy().to_string();
            writeln!(file, "{}", file_path).expect("Unable to write to file");
        }
    }
}

fn main() {
    list_files("/");
}
