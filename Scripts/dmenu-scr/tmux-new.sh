#!/usr/bin/zsh

choices=" RSS\nﳳ Pass\n Server\n Music\n Android\n Anoux"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#2f8a47" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    ' RSS') 
    exec alacritty --class rss -e "$TMUX_SCRIPTS/rss.sh";;
    
    #' Codelamp') 
    #exec alacritty -e "$TMUX_SCRIPTS/ims.sh";;
    
    ' Music')
    exec alacritty -o font.offset.y=-1 -o font.offset.x=-1 --class music,Music -e "$TMUX_SCRIPTS/music.sh";;

    'ﳳ Pass')
    exec alacritty -e "$TMUX_SCRIPTS/pass.sh";;

    ' Server')
    exec alacritty -e "$TMUX_SCRIPTS/contre-server.sh";;

    ' Anoux')
    exec alacritty -e "$TMUX_SCRIPTS/anoux.sh";;

    ' Android')
    exec alacritty -e "$TMUX_SCRIPTS/termux.sh";;
    
    #' Mac')
    #exec alacritty -e "$TMUX_SCRIPTS/mac.sh";;
esac
