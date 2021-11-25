#!/bin/zsh
choices=" Bose\n AirPods\n All"
var=$(echo -e $choices | dmenu -i -p "Bluetooth  : " -sb "#428EDC" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    ' Bose')
    bluetoothctl connect 2C:41:A1:C8:85:8E;;
    
    ' AirPods') 
    bluetoothctl connect 38:EC:0D:38:2D:1F;;

    ' All') 
        bluetoothctl connect $(bluetoothctl devices | awk -F" " '{print " " $3" - "$2}' | dmenu -i -p "Bluetooth  : " -sb "#428EDC" -fn "JetBrainsMono Nerd Font" -l 10 | awk -F" - " '{print $2}');;
    
esac
