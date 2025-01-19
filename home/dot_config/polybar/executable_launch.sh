#! /usr/bin/env bash

# terminate already running bar instances
polybar-msg cmd quit >/dev/null 2>&1
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# state=$(polybar -m | awk -F ':' '{print $1}' | sort | paste -s -d ' ')

echo "---" | tee -a /tmp/polybar1.log
polybar --config=$HOME/.config/polybar/config.ini dell-sharp 2>&1 | tee -a /tmp/polybar1.log & disown
