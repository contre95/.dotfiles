#!/usr/bin/env zsh
choices=$(pactl list sources short | grep -i "monitor"|awk -F' ' '{print $2}')
var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Audio Output" -sb "#40444B" -fn "JetBrainsMono Nerd Font" -l 20) 
TMUX_SCRIPTS=/home/canus/scripts/tmux-scr

exec pactl set-default-sink $var
