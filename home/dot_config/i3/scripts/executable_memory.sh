#!/usr/bin/env bash

echo "$(free --mega | grep -i 'Mem:' | awk '{print $7 ".0/" $2 ".0" "*100.0"}' | bc -l | cut -c -4 || echo "nan")%"
