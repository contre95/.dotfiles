#!/bin/bash
choices="Screenshot\nScreeshot Clipboard\nWindow class\nWindow xprop"
var=$(echo -e "$choices" | dmenu -i -p "Audio Output" -sb "#6D6D6D" -fn "JetBrainsMono Nerd Font") 

case $var in
    'Screenshot')
      "$SCR_PATH"/x-scr/screeshot.sh ;;
    
    'Window class') 
      xprop| grep WM_CLASS | xclip -sel clip && notify-send "Window class" "copied to clipboard" -i "$MY_FOLDER"/Library/icons/clipboard.png ;;

    'Screeshot Clipboard') 
      "$SCR_PATH"/x-scr/screeshot-clip.sh ;;

    'Window xprop')
      xprop | xclip -sel clip && notify-send "Window info" "copied to clipboard" -i "$MY_FOLDER"/Library/icons/clipboard.png ;;
esac

