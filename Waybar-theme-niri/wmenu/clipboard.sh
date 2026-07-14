#!/bin/sh
count=$(cliphist list | wc -l)
[ "$count" -eq 0 ] && notify-send "Clipboard" "No items in clipboard" && exit 1
lines=$(( count < 20 ? count : 20 ))
selected=$(cliphist list | wmenu \
    -i \
    -N '#282828' \
    -n '#ebdbb2' \
    -p 'Copy:' \
    -M '#282828' \
    -m '#ebdbb2' \
    -S '#3c3836' \
    -s '#ebdbb2' \
    -l "$lines" \
    -f 'Iosevka Nerd Font 14')
[ -n "$selected" ] && cliphist decode "${selected%%	*}" | wl-copy
