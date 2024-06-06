#!/usr/bin/env bash

choices=" RSS\n Server\n Music\n N26\n Android\n Anoux\n Mac\n Remarkable"
var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Exit menu: " -sb "#2f8a47" -fn "JetBrainsMono Nerd Font")
TMUX_SCRIPTS=/home/canus/scripts/tmux-scr

case $var in

' Server')
	exec alacritty -e "$TMUX_SCRIPTS/contre-server.sh"
	;;
esac
