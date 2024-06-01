#!/usr/bin/env bash

if wpctl get-volume @DEFAULT_SOURCE@ | grep "MUTED" >/dev/null 2>&1; then
  wpctl set-mute @DEFAULT_SOURCE@ 0
  notify-send "Mic Monitor" "muted toggle" -i "$MY_FOLDER"/library/icons/mic-on.png
else
  wpctl set-mute @DEFAULT_SOURCE@ 1
  notify-send "Mic Monitor" "muted toggle" -i "$MY_FOLDER"/library/icons/mic-off.png
fi 
