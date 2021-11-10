#!/bin/bash
source ~/.zshrc 

choices=$(ls -1 $MY_FOLDER/PDFS)
pdf=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#0F111A" -fn "JetBrainsMono Nerd Font" ) 

if [[ ! $pdf -eq "" ]];then
    zathura $MY_FOLDER/PDFS/$pdf &
fi
