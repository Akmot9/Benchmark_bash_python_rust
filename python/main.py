import os
import time
import logging

def list_files_recursive(directory, output_file):
    start_time = time.time()
    with open(output_file, 'w') as f:
        for root, dirs, files in os.walk(directory):
            for file in files:
                file_path = os.path.join(root, file)
                if os.path.isfile(file_path):
                    f.write(file_path + '\n')
    end_time = time.time()
    elapsed_time = end_time - start_time
    return elapsed_time

# Main entry point
if __name__ == '__main__':
    directory = '/home'
    output_file = 'files_python.txt'
    log_file = 'list_files_log.log'
    
    # Configure logging
    logging.basicConfig(filename=log_file, level=logging.INFO,
                        format='%(asctime)s - %(message)s')

    # Call the function and log the elapsed time
    elapsed_time = list_files_recursive(directory, output_file)
    logging.info(f"Elapsed time: {elapsed_time:.2f} seconds")
    
    print(f"List of regular files written to {output_file}.")
    print(f"Elapsed time: {elapsed_time:.2f} seconds. Check {log_file} for details.")
