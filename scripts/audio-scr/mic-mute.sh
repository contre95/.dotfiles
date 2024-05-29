#!/bin/bash

if wpctl status | grep "MUTED" >/dev/null 2>&1; then
  pactl set-source-mute 0 toggle && # 0 is default
  notify-send "Mic Monitor" "muted toggle" -i "$MY_FOLDER"/library/icons/mic-on.png
else
  pactl set-source-mute 0 toggle &&# 0 is default 
  notify-send "Mic Monitor" "muted toggle" -i "$MY_FOLDER"/library/icons/mic-off.png
fi 

# Or with wireplumber
# wpctl set-mute $(wpctl status | grep -i 'C01U Pro condenser microphone Analog Stereo' | awk -F' ' '{print $3}' | tr -d '.') toggle

