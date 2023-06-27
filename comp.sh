#!/bin/bash

python_file="/home/akmot/Documents/GitHub/Benchmark_bash_python_rust/python/files_python.txt"
rust_file="/home/akmot/Documents/GitHub/Benchmark_bash_python_rust/rust/main/files_rust.txt"
output_file="comp.log"

diff "$python_file" "$rust_file" > "$output_file"