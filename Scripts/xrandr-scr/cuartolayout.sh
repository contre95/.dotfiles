#!/bin/sh
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode HDMI1 1920x1080_60.00
xrandr --output HDMI1 --mode 1920x1080_60.00
xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI1 --mode 1920x1080_60.00 --pos 0x0 --rotate inverted --output VIRTUAL1 --off
