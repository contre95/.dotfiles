#!/usr/bin/env bash
choices=" Instagram\n既 Twitch\n Youtube"

var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Exit menu: " -sb "#9147FF" -fn "JetBrainsMono Nerd Font")

case "$var" in
" Instagram")
	exec brave --profile-directory="Contre" --app=https://instagram.com
	;;
"既 Twitch")
	exec brave --profile-directory="Contre" --app=https://twitch.tv
	;;
" Youtube")
	exec brave --profile-directory="Codelamp" --app=https://youtube.com
	;;
esac
