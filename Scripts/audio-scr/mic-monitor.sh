#!/bin/bash
#mapfile -t LOOPBACKMODULES < <(pactl list short modules | awk '$2 =="module-loopback" { print $1 }') # mapfile is only available in bash>=4

if [[ $(amixer -c 4 | grep "Playback \[off]") ]]; then # 1 becaouse for some reason there's an empty something in the array (don't wanna bother)
	amixer -c 4 set Mic unmute &&
	notify-send "Mic Monitor" "ON" -i "$MY_FOLDER"/Library/icons/moniton.png
else
	amixer -c 4 set Mic mute &&
	notify-send "Mic Monitor" "OFF" -i "$MY_FOLDER"/Library/icons/monitoff.png
fi
