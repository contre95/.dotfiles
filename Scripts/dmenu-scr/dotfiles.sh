#!/bin/zsh
choices="sxhkd\nbspwm\nvimrc\nlemonbar\nzsh\ntmux\nalacritty"
var=$(echo -e $choices | dmenu -i -p "Audio Output" -sb "#40444B" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'vimrc')
    choice="$HOME/.config/nvim/init.lua";;
    'bspwm')
    choice="$HOME/.config/bspwm/bspwmrc";;
    'sxhkd')
    choice="$HOME/.config/sxhkd/sxhkdrc";;
    'lemonbar')
    choice="$HOME/.config/lemonbar/bar.py";;
    'alacritty')
    choice="$HOME/.config/alacritty/alacritty.yml";;
    'zsh')
    choice="$HOME/.zshrc";;
    'tmux')
    choice="$HOME/.tmux.conf";;
esac

#if [[ ! "$choice" -eq "" ]];then
    alacritty -e nvim "$choice" -c "set autochdir"

#fi
