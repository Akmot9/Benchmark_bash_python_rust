#!/bin/bash

maxVal=100000

# Function to log the script execution time
log_execution_time() {
    local script_name="$1"
    local start_time="$2"
    local end_time="$3"

    local start_seconds=$(date -d "$start_time" +%s)
    local end_seconds=$(date -d "$end_time" +%s)
    local execution_time=$((end_seconds - start_seconds))

    echo "Script: $script_name" >> logfile.log
    
    echo "Execution Time: $execution_time seconds" >> logfile.log
    echo "---" >> logfile.log
}

echo " " >> logfile.log

echo "Max Value: $maxVal" >> logfile.log

# Run countPrint script and log execution time
start_time_countprint=$(date +"%Y-%m-%d %T")
echo "Running countPrint script..."
./Count/bash/countPrint/main.sh $maxVal
end_time_countprint=$(date +"%Y-%m-%d %T")
log_execution_time "countPrint.sh" "$start_time_countprint" "$end_time_countprint" $maxVal

echo -e "\e[32mScripts execution completed.\e[0m"

# Run CountBg script and log execution time
start_time_countbg=$(date +"%Y-%m-%d %T")
echo "Running CountBg script..."
./Count/bash/CountBg/main.sh $maxVal
end_time_countbg=$(date +"%Y-%m-%d %T")
log_execution_time "CountBg.sh" "$start_time_countbg" "$end_time_countbg" $maxVal

echo -e "\e[32mScripts execution completed.\e[0m"

# Run countPrint python script and log execution time
start_time_countprint=$(date +"%Y-%m-%d %T")
echo "Running countPrint script..."
./Count/python/countPrint/main.py $maxVal
end_time_countprint=$(date +"%Y-%m-%d %T")
log_execution_time "countPrint.py" "$start_time_countprint" "$end_time_countprint" $maxVal

echo -e "\e[32mScripts execution completed.\e[0m"

# Run CountBg python script and log execution time
start_time_countbg=$(date +"%Y-%m-%d %T")
echo "Running CountBg script..."
./Count/python/CountBg/main.py $maxVal
end_time_countbg=$(date +"%Y-%m-%d %T")
log_execution_time "CountBg.py" "$start_time_countbg" "$end_time_countbg" $maxVal

echo -e "\e[32mScripts execution completed.\e[0m"
