#!/bin/bash

count_to=$1


for ((i=1; i<=count_to; i++)); do
    echo $i 
done

wait

echo "Counting completed."
