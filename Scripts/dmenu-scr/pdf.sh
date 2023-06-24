#!/bin/bash
source ~/.zshrc 

pdf=$(ls -1 "$MY_FOLDER"/PDFS | dmenu -m DP-3 -i -p "Exit menu: " -sb "#0F111A" -fn "JetBrainsMono Nerd Font") 

if [[ ! $pdf -eq "" ]];then
    zathura "$MY_FOLDER/PDFS/$pdf" &
fi
