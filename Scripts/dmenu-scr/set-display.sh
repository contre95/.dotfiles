#!/bin/zsh
source ~/.zshrc
SCR_PATH=$MY_FOLDER/Scripts

choices="Single\nDual Up Inverted\nDual Up\nManual\nVertical"

chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#7E33FF" )

case "$chosen" in
	"Single") ${SCR_PATH}/xrandr-scr/singlelayout.sh ;;
	"Dual Up Inverted") ${SCR_PATH}/xrandr-scr/cuartolayout.sh ;;
	"Dual Up") ${SCR_PATH}/xrandr-scr/dualup.sh ;;
	"Vertical") ${SCR_PATH}/xrandr-scr/vertical.sh ;;
	"Manual") /usr/bin/arandr;;
esac
