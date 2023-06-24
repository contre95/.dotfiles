#!/bin/zsh
choices=" Bose\n AirPods\n All"
var=$(echo -e $choices | dmenu -m DP-3 -i -p "Bluetooth  : " -sb "#428EDC" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    ' Bose')
    bluetoothctl connect 2C:41:A1:C8:85:8E;;
    
    ' AirPods') 
    bluetoothctl connect 50:57:8A:F2:D1:4F;;

    ' All') 
        bluetoothctl connect $(bluetoothctl devices | awk -F" " '{print " " $3" - "$2}' | dmenu -m DP-3 -i -p "Bluetooth  : " -sb "#428EDC" -fn "JetBrainsMono Nerd Font" -l 10 | awk -F" - " '{print $2}');;
    
esac
