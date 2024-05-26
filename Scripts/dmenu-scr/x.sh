#!/usr/bin/env bash
choices="Screenshot\nScreeshot Clipboard\nWindow class\nWindow xprop"
var=$(echo -e "$choices" | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Audio Output" -sb "#6D6D6D" -fn "JetBrainsMono Nerd Font") 

case $var in
    'Screenshot')
      "$SCR_PATH"/x-scr/screenshot.sh ;;
    
    'Screeshot Clipboard') 
      "$SCR_PATH"/x-scr/screenshot-clip.sh ;;

    'Window class') 
      xprop| grep WM_CLASS | xclip -sel clip && notify-send "Window class" "copied to clipboard" -i "$MY_FOLDER"/Library/icons/clipboard.png ;;

    'Window xprop')
      xprop | xclip -sel clip && notify-send "Window info" "copied to clipboard" -i "$MY_FOLDER"/Library/icons/clipboard.png ;;
esac

