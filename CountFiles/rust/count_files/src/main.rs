use std::fs;
//use std::path::Path;

fn count_files_recursive(start_path: &str) -> u64 {
    let mut file_count: u64 = 0;

    let entries = fs::read_dir(start_path)?;
    for entry in entries {
        let entry = entry?;
        let path = entry.path();

        if path.is_file() {
            println!("Fichiers : {}", path.display());
            file_count += 1;
        } else if path.is_dir() {
            let sub_dir_count = count_files_recursive(path.to_str().unwrap())?;
            println!("Fichiers : {}", path.display());
            println!("truc : {}", sub_dir_count);
            //file_count += sub_dir_count;
        }
    }

    file_count
}

fn main() {
    let num_files = count_files_recursive("/home/akmot/Documents/GitHub");
    match num_files {
        Ok(count) => println!("Le nombre total de fichiers dans le dossier et ses sous-dossiers est : {}", count),
        Err(e) => eprintln!("Erreur lors du comptage des fichiers : {}", e),
    }
}
