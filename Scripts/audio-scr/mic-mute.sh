#!/bin/bash

notify-send "Mic Monitor" "muted toggle" -i "$MY_FOLDER"/Library/icons/muted.png
pactl set-source-mute 0 toggle # 0 is default

# Or with wireplumber
# wpctl set-mute $(wpctl status | grep -i 'C01U Pro condenser microphone Analog Stereo' | awk -F' ' '{print $3}' | tr -d '.') toggle

