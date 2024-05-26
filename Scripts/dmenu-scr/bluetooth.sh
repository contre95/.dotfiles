#!/usr/bin/env zsh
bluetoothctl connect $(bluetoothctl devices | awk '{mac=$2; $1=$2=""; gsub(/^[ \t]+|[ \t]+$/, ""); print "󰂯 " $0 " - " mac }' | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Bluetooth  : " -fn "JetBrainsMono Nerd Font" -l 10 | awk -F" - " '{print $2}')
