use std::process::Command;

pub fn execute_process(path: &str, argument: i32) {
    let output = Command::new(path)
        .arg(argument.to_string())
        .output();
    //append_to_log_file(path) ;
    match output {
        Ok(result) => {
            if result.status.success() {
                let stdout = String::from_utf8_lossy(&result.stdout);
                let stderr = String::from_utf8_lossy(&result.stderr);

                println!("Execution succeeded for path: {}", path);
                println!("Standard Output:\n{}", stdout);
                println!("Standard Error:\n{}", stderr);
            } else {
                let stderr = String::from_utf8_lossy(&result.stderr);

                println!("Execution failed for path: {}", path);
                println!("Standard Error:\n{}", stderr);
            }
        }
        Err(error) => {
            println!("Error executing command for path: {}", path);
            println!("Error details: {}", error);
        }
    }
}
