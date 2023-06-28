#!/bin/bash

maxVal=1000000

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
./Count/bash/countPrint/main_v2.sh $maxVal
end_time_countprint=$(date +"%Y-%m-%d %T")
log_execution_time "countPrint.sh" "$start_time_countprint" "$end_time_countprint" $maxVal

echo -e "\e[32mScripts bash print execution completed.\e[0m"

# Run CountBg script and log execution time
start_time_countbg=$(date +"%Y-%m-%d %T")
echo "Running CountBg script..."
./Count/bash/CountBg/main_v2.sh $maxVal
end_time_countbg=$(date +"%Y-%m-%d %T")
log_execution_time "CountBg.sh" "$start_time_countbg" "$end_time_countbg" $maxVal

echo -e "\e[32mScripts bash bg execution completed.\e[0m"

# Run countPrint python script and log execution time
start_time_countprint=$(date +"%Y-%m-%d %T")
echo "Running countPrint script..."
./Count/python/countPrint/main_v2.py $maxVal
end_time_countprint=$(date +"%Y-%m-%d %T")
log_execution_time "countPrint.py" "$start_time_countprint" "$end_time_countprint" $maxVal

echo -e "\e[32mScripts python print execution completed.\e[0m"

# Run CountBg python script and log execution time
start_time_countbg=$(date +"%Y-%m-%d %T")
echo "Running CountBg python script..."
./Count/python/CountBg/main_v2.py $maxVal
end_time_countbg=$(date +"%Y-%m-%d %T")
log_execution_time "CountBg.py" "$start_time_countbg" "$end_time_countbg" $maxVal

echo -e "\e[32mScripts python bg execution completed.\e[0m"

# Run countPrint rust script and log execution time
start_time_countprint=$(date +"%Y-%m-%d %T")
echo "Running countPrint script..."
./Count/rust/count_print/target/debug/count_print $maxVal
end_time_countprint=$(date +"%Y-%m-%d %T")
log_execution_time "count_print" "$start_time_countprint" "$end_time_countprint" $maxVal

echo -e "\e[32mScripts rust print execution completed.\e[0m"

# Run CountBg rust script and log execution time
start_time_countbg=$(date +"%Y-%m-%d %T")
echo "Running CountBg rust script..."
./Count/rust/count_bg/target/debug/count_bg $maxVal
end_time_countbg=$(date +"%Y-%m-%d %T")
log_execution_time "Count_Bg" "$start_time_countbg" "$end_time_countbg" $maxVal

echo -e "\e[32mScripts rust bg execution completed.\e[0m"
