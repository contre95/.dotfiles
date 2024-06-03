#!/usr/bin/env bash

# Picker script receives as first arguments files with the following format 
#
# Name,value
# ------
# For example:
# Google,https://google.com
# Drive,http://drive.google.com
# Google Photos,http://photos.google.com

choices=$(awk -F',' '{print $1}' < "$1")
var="$(echo -e "$choices" | rofi -dmenu -theme "$HOME"/.config/rofi/dmenu.style.rasi -i -p 'Pick: ' -sb '#7681C5' -fn 'JetBrainsMono Nerd Font')"
picked=$(grep "$var" "$1" | awk -F',' '{print $2}')
# echo "$(zenity --entry --text='Bookmark:'),$(zenity --entry --text='URL:')" >>"$MY_FOLDER"/info/bookmarks.txt
echo "$picked"
