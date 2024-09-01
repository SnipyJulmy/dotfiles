#!/usr/bin/env bash

echo "$(free --mega | grep -i 'Swap:' | awk '{print $3 ".0/" $2 ".0" "*100.0"}' | bc -l | cut -c -4 || echo "nan")%"
