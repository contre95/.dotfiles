#!/usr/bin/env zsh
#
choices="sxhkd\nbspwm\nvimrc\nlemonbar\nzsh\ntmux\nwpaperd\nwaybar\nwaybar-css\nhyprland\nalacritty\nscripts"
var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Dotfiles" -sb "#40444B" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'vimrc')
    choice="$HOME/.config/nvim/init.lua";;
    'hyprland')
    choice="$HOME/.config/hypr/hyprland.conf";;
    'wpaperd')
    choice="$HOME/.config/wpaperd/wallpaper.toml";;
    'waybar')
    choice="$HOME/.config/waybar/$MYENV.config.jsonc";;
    'waybar-css')
    choice="$HOME/.config/waybar/style.css";;
    'bspwm')
    choice="$HOME/.config/bspwm/bspwmrc";;
    'sxhkd')
    choice="$HOME/.config/sxhkd/sxhkdrc";;
    'lemonbar')
    choice="$HOME/.config/lemonbar/bar.py";;
    'scripts')
    choice=$SCR_PATH/$(find $SCR_PATH -type f | sed "s|$SCR_PATH/||" | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Scripts" -sb "#40444B" -fn "JetBrainsMono Nerd Font");;
    'alacritty')
    choice="$HOME/.config/alacritty/alacritty.toml";;
    'zsh')
    choice="$HOME/.zshrc";;
    'tmux')
    choice="$HOME/.tmux.conf";;
esac

if [[ $choice ]];then
    alacritty -e nvim "$choice" -c "set autochdir"

fi
