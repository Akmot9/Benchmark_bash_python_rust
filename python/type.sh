#!/bin/bash

# Variables
file_path="files_python.txt"
file_types=()

# Read file line by line
while IFS= read -r line; do
  # Get file type
  file_type=$(file -b --mime-type "$line")
  # Append file type to array
  file_types+=("$file_type")
done < "$file_path"

# Count occurrences of each file type
declare -A file_type_counts
for file_type in "${file_types[@]}"; do
  ((file_type_counts[$file_type]++))
done

# Print file type counts
echo "File Type Counts:"
for file_type in "${!file_type_counts[@]}"; do
  count="${file_type_counts[$file_type]}"
  echo "$file_type: $count"
done
