#!/bin/bash

if [[ $(echo always-true-fix) ]]; then # 1 becaouse for some reason there's an empty something in the array (don't wanna bother)
	notify-send "Mic Monitor" "muted" -i "$MY_FOLDER"/Library/icons/muted.png
    pactl set-source-mute alsa_input.usb-Samson_Technologies_Samson_C01U_Pro_Mic-00.analog-stereo toggle
else
	notify-send "Mic Monitor" "unmuted" -i "$MY_FOLDER"/Library/icons/mic.png
    pactl set-source-mute alsa_input.usb-Samson_Technologies_Samson_C01U_Pro_Mic-00.analog-stereo toggle
fi
