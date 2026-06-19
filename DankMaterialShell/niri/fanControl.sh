#!/bin/bash

# Find the correct hwmon path for hp
HW_PATH=$(for hw in /sys/class/hwmon/hwmon*; do
    if [[ "$(cat "$hw/name" 2>/dev/null)" == "hp" ]]; then
        echo "$hw"
        break
    fi
done)

# Build pwm path
BOOST_PATH="$HW_PATH/pwm1_enable"

# Safety check
if [[ ! -e "$BOOST_PATH" ]]; then
    notify-send -i dialog-warning "Fan Mode" "pwm1_enable not found"
    exit 1
fi

current_state=$(cat "$BOOST_PATH")

case "$current_state" in
    0)
        echo 2 > "$BOOST_PATH"
        notify-send "Fan Mode" "💤 Boost mode OFF"
        ;;
    2)
        echo 0 > "$BOOST_PATH"
        notify-send "Fan Mode" "🌀 Boost mode ON"
        ;;
    *)
        notify-send  "Fan Mode" "Unknown fan mode: $current_state"
        ;;
esac
