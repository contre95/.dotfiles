#!/bin/zsh
choices=" Headphones\nﰝ Speakers\n Mic"
var=$(echo -e $choices | dmenu -i -p "Audio Output" -sb "#40444B" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'ﰝ Speakers')
    exec pactl set-default-sink 1;;
    
    ' Mic') 
    exec pactl set-default-sink 0;;

    ' Headphones') 
    exec pactl set-default-sink 2;;
esac
