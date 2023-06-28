#!/usr/bin/env python3

import sys

count_to = int(sys.argv[1])
result = 0

for i in range(1, count_to + 1):
    result += 1
    print(result)

print("Counting completed.")
print("Result:", result)
