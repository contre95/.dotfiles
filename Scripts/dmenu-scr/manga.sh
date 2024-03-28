#!/bin/bash
source ~/.zshrc 
MANGA_FOLDER="$MY_FOLDER/Documents/manga/"
koreader "$MANGA_FOLDER/$(ls -1 $MANGA_FOLDER | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -i -p 'Exit menu: ' -sb '#0F111A' -fn 'JetBrainsMono Nerd Font')"
