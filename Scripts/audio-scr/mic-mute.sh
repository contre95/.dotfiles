#!/bin/bash

notify-send "Mic Monitor" "muted toggle" -i "$MY_FOLDER"/Library/icons/muted.png
pactl set-source-mute 0 toggle # 0 is default

