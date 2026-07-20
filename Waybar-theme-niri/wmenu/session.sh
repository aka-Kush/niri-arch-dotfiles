#!/bin/sh

choice=$(printf 'lock\nlogout\nsuspend\nreboot\npoweroff' | wmenu \
    -N '#282828' \
    -n '#ebdbb2' \
    -p 'Session:' \
    -M '#282828' \
    -m '#ebdbb2' \
    -S '#3c3836' \
    -s '#ebdbb2' \
    -l 5 \
    -f 'Iosevka Nerd Font 14')

case "$choice" in
    lock) swaylock ;;
    logout) niri msg action quit ;;
    suspend) systemctl suspend && swaylock ;;
    reboot) systemctl reboot ;;
    poweroff) systemctl poweroff ;;
esac
