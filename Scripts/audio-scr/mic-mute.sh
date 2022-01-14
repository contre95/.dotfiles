#!/bin/bash
#mapfile -t LOOPBACKMODULES < <(pactl list short modules | awk '$2 =="module-loopback" { print $1 }') # mapfile is only available in bash>=4

if [[ $(amixer -c 3 | grep "Playback \[off]") ]]; then # 1 becaouse for some reason there's an empty something in the array (don't wanna bother)
	notify-send "Mic Monitor" "muted" -i "$MY_FOLDER"/Library/icons/muted.png
	amixer -c 3 set Mic unmute
else
	notify-send "Mic Monitor" "muted" -i "$MY_FOLDER"/Library/icons/mic.png
	amixer -c 3 set Mic mute
fi
