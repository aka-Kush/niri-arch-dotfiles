#!/bin/sh

choice=$(printf 'Lock\nLogout\nSuspend\nReboot\nPoweroff' | wmenu \
    -i \
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
    Lock) swaylock ;;
    Logout) niri msg action quit ;;
    Suspend) systemctl suspend && swaylock ;;
    Reboot) systemctl reboot ;;
    Poweroff) systemctl poweroff ;;
esac
