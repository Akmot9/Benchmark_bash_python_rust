#!/bin/bash

count_to=$1


for ((i=1; i<=count_to; i++)); do
    echo $i > /dev/null
done

wait




