#!/bin/bash

# Function to count lines in a file
count_lines() {
    local file="$1"
    local lines=$(wc -l < "$file")
    echo "File: $file "
    echo "Lines: $lines"
    echo ""
}

# Recursive function to process files
process_files() {
    local dir="$1"
    
    # Loop through files in the directory
    for file in "$dir"/*; do
        if [[ -f "$file" ]]; then
            if [[ "$file" == *.txt ]]; then
                count_lines "$file"
            fi
        elif [[ -d "$file" ]]; then
            process_files "$file"
        fi
    done
}

# Get the current working directory
cwd=$(pwd)

# Call the recursive function starting from the current directory
process_files "$cwd"
