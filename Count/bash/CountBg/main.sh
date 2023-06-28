#!/bin/bash

echo "Counting started."

for ((i=1; i<=100000; i++))
do
    echo $i 
done

wait

echo "Counting completed."
