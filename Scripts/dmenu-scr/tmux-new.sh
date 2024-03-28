#!/bin/bash

choices=" RSS\n Server\n Music\n N26\n Android\n Anoux\n Mac\n Remarkable"
var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Exit menu: " -sb "#2f8a47" -fn "JetBrainsMono Nerd Font")
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in

' RSS')
	exec alacritty --class rss -e "$TMUX_SCRIPTS/rss.sh"
	;;

' Music')
	exec alacritty -o font.offset.y=-1 -o font.offset.x=-1 --option window.opacity=0.7 --class music,Music -e "$TMUX_SCRIPTS/music.sh"
	;;

' N26')
	exec alacritty -e "$TMUX_SCRIPTS/n26.sh"
	;;

' Server')
	exec alacritty -e "$TMUX_SCRIPTS/contre-server.sh"
	;;

' Mac')
	exec alacritty -e "$TMUX_SCRIPTS/mac.sh"
	;;

' Remarkable')
	exec alacritty -e "$TMUX_SCRIPTS/rmkb.sh"
	;;

' Anoux')
	exec alacritty -e "$TMUX_SCRIPTS/anoux.sh"
	;;

' Android')
	exec alacritty -e "$TMUX_SCRIPTS/termux.sh"
	;;

esac
