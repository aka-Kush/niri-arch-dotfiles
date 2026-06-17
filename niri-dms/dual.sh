#!/bin/bash

cat > ~/.config/niri/monitor.kdl << 'EOF'
output "HDMI-A-1" {
    mode "1920x1080@180"
    scale 1
    transform "normal"
    position x=0 y=0
}
output "eDP-1" {
    mode "1920x1080@144"
    scale 1
    transform "normal"
    position x=1920 y=0
}
EOF

notify-send  "Dual Monitor Setup"

