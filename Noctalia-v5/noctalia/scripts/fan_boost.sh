#!/usr/bin/env bash

FILE="/sys/devices/platform/omen-rgb-keyboard/fan/max_fan"

current=$(cat "$FILE")
new=$((1 - current))

echo "$new" > "$FILE"

if [[ "$new" -eq 1 ]]; then
    notify-send "Fan Boost" "Fan boost mode ON"
else
    notify-send "Fan Boost" "Fan boost mode OFF"
fi

