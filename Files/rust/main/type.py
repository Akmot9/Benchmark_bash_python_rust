import subprocess

file_path = "files_rust.txt"
output_file = "types_rust.txt"
file_types = []

# Read file line by line
with open(file_path, "r") as file:
    for line in file:
        file_path = line.strip()
        # Get file type using subprocess
        result = subprocess.run(["file", "-b", "--mime-type", file_path], capture_output=True, text=True)
        file_type = result.stdout.strip()
        # Append file type to list
        file_types.append(file_type)

# Count occurrences of each file type
file_type_counts = {}
for file_type in file_types:
    if file_type in file_type_counts:
        file_type_counts[file_type] += 1
    else:
        file_type_counts[file_type] = 1

# Write file type counts to output file
with open(output_file, "w") as file:
    file.write("File Type Counts:\n")
    for file_type, count in file_type_counts.items():
        file.write(f"{file_type}: {count}\n")

print(f"File type counts have been written to {output_file}.")
