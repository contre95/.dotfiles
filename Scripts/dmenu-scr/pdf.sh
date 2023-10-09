#!/bin/bash
source ~/.zshrc 
PDF_FOLDER="$MY_FOLDER/Documents/pdf"
pdf=$(ls $PDF_FOLDER -1 | dmenu  -i -p "Exit menu: " -sb "#0F111A" -fn "JetBrainsMono Nerd Font") 

if [[ ! $pdf -eq "" ]];then
    zathura "$PDF_FOLDER/$pdf" &
fi
