#!/usr/bin/env zsh
#
choices="vimrc\nzsh\nnixos\ntmux\nwaybar\nwaybar-css\nhyprland\nalacritty\nscripts"
var=$(echo -e $choices | rofi -dmenu -theme $MY_FOLDER/dotfiles/rofi/dmenu.style.rasi -i -p "Dotfiles" -sb "#40444B" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'vimrc')
    choice="$MY_FOLDER/dotfiles/nvim/init.lua";;
    'hyprland')
    choice="$MY_FOLDER/dotfiles/hypr/hyprland.conf";;
    'waybar')
    choice="$MY_FOLDER/dotfiles/waybar/$MYENV.config.jsonc";;
    'waybar-css')
    choice="$MY_FOLDER/dotfiles/waybar/style.css";;
    'nixos')
    choice="$MY_FOLDER/dotfiles/nixos/configuration.nix";;
    'scripts')
    choice=$SCR_PATH/$(find $SCR_PATH -type f | sed "s|$SCR_PATH/||" | rofi -dmenu -theme $MY_FOLDER/dotfiles/rofi/dmenu.style.rasi -i -p "Scripts" -sb "#40444B" -fn "JetBrainsMono Nerd Font");;
    'alacritty')
    choice="$MY_FOLDER/dotfiles/alacritty/alacritty.toml";;
    'zsh')
    choice="$MY_FOLDER/dotfiles/zsh/.zshrc";;
    'tmux')
    choice="$MY_FOLDER/dotfiles/tmux/.tmux.conf";;
esac

if [[ $choice ]];then
    alacritty -e nvim "$choice" -c "set autochdir"

fi
