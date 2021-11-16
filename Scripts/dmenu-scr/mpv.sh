#!/bin/bash

choices=' Twitch\n YouTube\n Video'
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#9147FF" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Twitch')
        link="https://www.twitch.tv/$(zenity --entry --text="Twitch channel:")"
        streamlink --player mpv $link best
        ;;
    ' YouTube')
        /home/canus/Scripts/dmenu-scr/yt;;
    ' Video')
        mpv av://v4l2:$(ls /dev/video* | dmenu -i -p "Exit menu: " -sb "#9147FF" -fn "JetBrainsMono Nerd Font" )
esac
