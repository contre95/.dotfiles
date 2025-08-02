#!/usr/bin/env zsh
#
choices="vimrc\nzsh\nnixos\ntmux\nwaybar\nwaybar-css\nhyprland\nghostty\nfirefox\nscripts\nkitty"
var=$(echo -e $choices | rofi -dmenu -theme $MY_FOLDER/dotfiles/rofi/dmenu.style.rasi -i -p "Dotfiles" -sb "#40444B" -fn "JetBrainsMono Nerd Font")
TMUX_SCRIPTS=/home/canus/scripts/tmux-scr

case $var in
'vimrc')
  choice="$MY_FOLDER/dotfiles/nvim/init.lua"
  ;;
'hyprland')
  choice="$MY_FOLDER/dotfiles/hypr/hyprland.conf"
  ;;
'kitty')
  choice="$MY_FOLDER/dotfiles/kitty/kitty.conf"
  ;;
'waybar')
  choice="$MY_FOLDER/dotfiles/waybar/$MYENV.config.jsonc"
  ;;
'waybar-css')
  choice="$MY_FOLDER/dotfiles/waybar/style.css"
  ;;
'nixos')
  choice="$MY_FOLDER/flake.nix"
  ;;
'scripts')
  choice=$SCR_PATH/$(find $SCR_PATH -type f | sed "s|$SCR_PATH/||" | rofi -dmenu -theme $MY_FOLDER/dotfiles/rofi/dmenu.style.rasi -i -p "Scripts" -sb "#40444B" -fn "JetBrainsMono Nerd Font")
  ;;
'ghostty')
  choice="$MY_FOLDER/dotfiles/ghostty/config"
  ;;
'zsh')
  choice="$MY_FOLDER/dotfiles/nixos/programs/zsh.nix"
  ;;
'firefox')
  choice="$MY_FOLDER/dotfiles/nixos/programs/firefox.nix"
  ;;
'tmux')
  choice="$MY_FOLDER/dotfiles/tmux/.tmux.conf"
  ;;
esac

if [[ $choice ]]; then
  ghostty -e "nvim $choice -c 'set autochdir'"

fi
