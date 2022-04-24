#!/bin/zsh

"""
Picker script receives as first arguments files with the following format 

Name2 - value2
Name  - value
------
For example:
Google    - https://google.com
Drive     - http://drive.google.com
Photos    - http://photos.google.com
"""
choices=$(cat $1 | tr -d " " | awk -F"-" '{print $1}')
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font")
picked=$(grep $var $1 | tr -d " " | awk -F"-" '{print $2}')

echo $picked
