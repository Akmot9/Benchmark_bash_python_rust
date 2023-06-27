import subprocess

python_file="/home/akmot/Documents/GitHub/Benchmark_bash_python_rust/python/files_python.txt"
rust_file="/home/akmot/Documents/GitHub/Benchmark_bash_python_rust/rust/main/files_rust.txt"

output_file = "diff.log"
report_file = "report.log"

# Run the diff command and capture the output
diff_process = subprocess.Popen(['diff', python_file, rust_file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
diff_output, diff_error = diff_process.communicate()

# Write the diff output to the output file
with open(output_file, 'w') as f:
    f.write(diff_output.decode())

# Interpret the diff output and generate the report
lines_added = {}
lines_removed = {}

for line in diff_output.decode().split('\n'):
    if line.startswith('>'):
        file_name, line_content = line[2:].split(':', 1) if ':' in line else ('', line[2:])
        if file_name not in lines_added:
            lines_added[file_name] = []
        lines_added[file_name].append(line_content.strip())
    elif line.startswith('<'):
        file_name, line_content = line[2:].split(':', 1) if ':' in line else ('', line[2:])
        if file_name not in lines_removed:
            lines_removed[file_name] = []
        lines_removed[file_name].append(line_content.strip())

# Write the report to the report file
with open(report_file, 'w') as f:
    f.write("Diff Report:\n\n")
    f.write("Lines Added:\n")
    for file_name, lines in lines_added.items():
        f.write(f"- From {file_name}:\n")
        for line in lines:
            f.write(f"  - {line}\n")

    f.write("\nLines Removed:\n")
    for file_name, lines in lines_removed.items():
        f.write(f"- From {file_name}:\n")
        for line in lines:
            f.write(f"  - {line}\n")

    f.write(f"\nNumber of Lines Added: {sum(len(lines) for lines in lines_added.values())}\n")
    f.write(f"Number of Lines Removed: {sum(len(lines) for lines in lines_removed.values())}\n")
    f.write(f"Number of Python Files Modified: {len(lines_added)}\n")
    f.write(f"Number of Rust Files Modified: {len(lines_removed)}\n")

print("Diff log generated successfully.")
print("Please check the report.log file for the user-friendly report.")
