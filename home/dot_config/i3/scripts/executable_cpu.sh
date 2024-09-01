#!/usr/bin/env bash

mpstat 1 1 | tail -2 | head -1 | cut -c 21- | awk '{print $1}' || echo "nan"
