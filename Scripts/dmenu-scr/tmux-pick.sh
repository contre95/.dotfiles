#!/usr/bin/zsh
alacritty -e /bin/zsh -c "tmux -u attach-session -t \"$(tmux -u list-sessions | awk -F':' '{print $1}' | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -l 20 -p ' Tmux: ' -sb '#3EAB7F' -fn 'JetBrainsMono Nerd Font')\""
