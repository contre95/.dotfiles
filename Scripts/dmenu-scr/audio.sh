#!/bin/zsh
choices=$(pactl list sources short | grep -i "monitor"|awk -F' ' '{print $2}')
var=$(echo -e $choices | dmenu -m DP-3 -i -p "Audio Output" -sb "#40444B" -fn "JetBrainsMono Nerd Font" -l 20) 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

exec pactl set-default-sink $var
