#!/usr/bin/zsh
alacritty -e /bin/zsh -c "tmux -u attach-session -t \"$(tmux -u list-sessions | awk -F':' '{print $1}' | dmenu -m DP-3 -l 20 -p ' Tmux: ' -sb '#3EAB7F' -fn 'JetBrainsMono Nerd Font')\""
