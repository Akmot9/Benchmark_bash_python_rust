import subprocess

file_path = "files_rust.txt"
output_file = "types2_rust.log"
file_types = {"regular": 0, "socket": 0, "symbolic link": 0, "pipe": 0}

# Read file line by line
with open(file_path, "r") as file:
    for line in file:
        file_path = line.strip()
        # Get file type using subprocess
        result = subprocess.run(["file", "-b", file_path], capture_output=True, text=True)
        file_type = result.stdout.strip().lower()
        # Classify file type
        if "regular file" in file_type:
            file_types["regular"] += 1
        elif "socket" in file_type:
            file_types["socket"] += 1
        elif "symbolic link" in file_type:
            file_types["symbolic link"] += 1
        elif "fifo (named pipe)" in file_type:
            file_types["pipe"] += 1

# Write file type counts to output file
with open(output_file, "w") as file:
    file.write("File Type Counts:\n")
    for file_type, count in file_types.items():
        file.write(f"{file_type}: {count}\n")

print(f"File type counts have been written to {output_file}.")
