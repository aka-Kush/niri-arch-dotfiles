#!/bin/sh
if pgrep -x wlsunset > /dev/null; then
    pkill wlsunset
else
    wlsunset -t 2000 -T 4000 &
fi
