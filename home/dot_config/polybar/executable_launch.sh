#! /usr/bin/env bash

polybar-msg cmd quit >/dev/null 2>&1
killall -q polybar

echo "---" | tee -a /tmp/polybar1.log
polybar --config=$HOME/.config/polybar/config.ini bar 2>&1 | tee -a /tmp/polybar1.log & disown
