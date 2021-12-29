#!/bin/bash
#mapfile -t LOOPBACKMODULES < <(pactl list short modules | awk '$2 =="module-loopback" { print $1 }') # mapfile is only available in bash>=4

if [[ $(amixer -c 3 | grep "Playback \[off]") ]]; then # 1 becaouse for some reason there's an empty something in the array (don't wanna bother)
	amixer -c 3 set Mic unmute &&
	notify-send "Mic Monitor" "muted" -i "$MY_FOLDER"/Library/icons/monitoff.png
else
	amixer -c 3 set Mic mute &&
	notify-send "Mic Monitor" "unmute" -i "$MY_FOLDER"/Library/icons/moniton.png
fi
