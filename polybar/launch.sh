#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar jes0 2>&1 | tee -a /tmp/polybar1.log & disown
polybar jes1 2>&1 | tee -a /tmp/polybar2.log & disown
polybar jes2 2>&1 | tee -a /tmp/polybar2.log & disown
polybar jes3 2>&1 | tee -a /tmp/polybar2.log & disown

polybar jes4 2>&1 | tee -a /tmp/polybar2.log & disown

polybar jes5 2>&1 | tee -a /tmp/polybar2.log & disown

polybar jes6 2>&1 | tee -a /tmp/polybar2.log & disown

polybar jes7 2>&1 | tee -a /tmp/polybar2.log & disown

polybar jes8 2>&1 | tee -a /tmp/polybar2.log & disown

polybar jes9 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
