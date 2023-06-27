#!/bin/bash

start_time=$(date +%s)

# Execute the find command and redirect the output to files_bash.txt
find /home/akmot/Documents/GitHub/Benchmark_bash_python_rust -type f > files_bash.txt

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))

# Logging the elapsed time
echo "Elapsed time: $elapsed_time seconds" >> list_files_log.log

echo "List of regular files written to files_bash.txt."
echo "Elapsed time: $elapsed_time seconds. Check list_files_log.txt for details."
