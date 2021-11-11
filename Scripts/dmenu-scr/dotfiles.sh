#!/bin/zsh
choices="sxhkd\nbspwm\nvimrc"
var=$(echo -e $choices | dmenu -i -p "Audio Output" -sb "#40444B" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'vimrc')
    choice="$HOME/.config/nvim/init.lua";;
    'bspwm')
    choice="$HOME/.config/bspwm/bspwmrc";;
    'sxhkd')
    choice="$HOME/.config/sxhkd/sxhkdrc";;
esac

#if [[ ! "$choice" -eq "" ]];then
    alacritty -e nvim "$choice"
#fi
