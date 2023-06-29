#!/bin/bash

maxVal=3

log_execution_time() {
    local script_name="$1"
    local start_time="$2"
    local end_time="$3"
    local pid_pross="$4"

    local start_seconds=$(date -d "$start_time" +%s)
    local end_seconds=$(date -d "$end_time" +%s)
    local execution_time=$((end_seconds - start_seconds))

    echo "Script: $script_name" >> logfile.log
    echo "PID: $pid_pross" >> logfile.log
    echo "Execution Time: $execution_time seconds" >> logfile.log
    echo "---" >> logfile.log
}

execute_script() {
    local script_path="$1"
    local script_name="$2"
    local start_time
    local end_time
    local pid_pross

    start_time=$(date +"%Y-%m-%d %T")
    echo "Running $script_name script..."
    "$script_path" "$maxVal" &
    pid_pross=$!
    wait $pid_pross
    end_time=$(date +"%Y-%m-%d %T")
    log_execution_time "$script_name" "$start_time" "$end_time" "$pid_pross"
}

process_files() {
    local file_paths=("$@")

    echo " " >> logfile.log
    echo "################### $(date +"%Y-%m-%d %T") ###############################" >> logfile.log

    for path in "${file_paths[@]}"; do
        if [ -x "$path" ]; then
            local script_name=$(basename "$path")
            execute_script "$path" "$script_name"
            echo -e "\e[32mExecution of $script_name completed.\e[0m"
        else
            echo -e "\e[31mError: $path is not executable or does not exist.\e[0m"
        fi
    done
}

# Example usage
file_paths=(
    "./Count/bash/countPrint/main_v2.sh"
    "./Count/bash/CountBg/main_v2.sh"
    "./Count/python/countPrint/main_v2.py"
    "./Count/python/CountBg/main_v2.py"
    "./Count/rust/count_print/target/debug/count_print"
    "./Count/rust/count_bg/target/debug/count_bg"
)

process_files "${file_paths[@]}"
