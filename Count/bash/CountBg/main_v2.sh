#!/bin/bash

count_to=$1
result=0

for ((i=1; i<=count_to; i++)); do
    ((result++))
    echo $result
done

wait

echo "Counting completed."
echo "Result: $result"
