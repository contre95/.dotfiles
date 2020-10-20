#!/bin/zsh
source ~/.zshrc
SCR_PATH=$MY_FOLDER/Scripts

choices="Single\nDual\nManual\nVertical\nVertical Mac"

chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#7E33FF" )

case "$chosen" in
	"Single")  xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off ;;
	"Dual") xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x483 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --mode 1920x1080 --pos 2560x483 --rotate normal ;;
	"Vertical") xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x483 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --mode 1920x1080 --pos 2560x0 --rotate right ;;
	"Vertical Mac") xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x840 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --mode 1920x1080 --pos 2560x0 --rotate right ;; 
	"Manual") /usr/bin/arandr;;
esac
