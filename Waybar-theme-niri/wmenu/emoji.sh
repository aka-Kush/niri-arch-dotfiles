#!/bin/sh
exec cat ~/.config/wmenu/emojis.txt | wmenu \
    -N '#282828' \
    -i \
    -n '#ebdbb2' \
    -p 'Copy:' \
    -M '#282828' \
    -m '#ebdbb2' \
    -S '#4c3836' \
    -s '#ebdbb2' \
    -l 10 \
    -f 'Iosevka Nerd Font 14' | cut -d' ' -f1 | wl-copy
