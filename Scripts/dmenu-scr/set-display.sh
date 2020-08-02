#!/bin/zsh
source ~/.zshrc
SCR_PATH=$MY_FOLDER/Scripts

choices="Single\nDual Up Inverted\nDual Up\nManual"

chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#7E33FF" )

case "$chosen" in
	"Single") ${SCR_PATH}/xrandr-scr/singlelayout.sh ;;
	"Dual Up Inverted") ${SCR_PATH}/xrandr-scr/cuartolayout.sh ;;
	"Dual Up") ${SCR_PATH}/xrandr-scr/dualup.sh ;;
	"Manual") /usr/bin/arandr;;
esac
