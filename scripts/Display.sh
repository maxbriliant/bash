#!/usr/bin/bash
echo "Monitor Rechts"
xrandr --output DP3 --mode 1920x1080 --refresh 74.92
sleep 3
xrandr --output HDMI2 --mode 1920x1080 --refresh 59.94 --left-of DP3
echo "Monitor Vorne"

#59.94
