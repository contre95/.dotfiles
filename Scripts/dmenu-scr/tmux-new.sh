#!/usr/bin/zsh
choices=" RSS\n Codelamp\nﳳ Pass\n Server\n Raspi\n Music\n Mac\n Android"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#2f8a47" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    ' RSS') 
    exec alacritty -e "$TMUX_SCRIPTS/rss.sh";;
    
    ' Codelamp') 
    exec alacritty -e "$TMUX_SCRIPTS/ims.sh";;
    
    ' Music')
    exec alacritty -e "$TMUX_SCRIPTS/music.sh";;

    'ﳳ Pass')
    exec alacritty -e "$TMUX_SCRIPTS/pass.sh";;

    ' Server')
    exec alacritty -e "$TMUX_SCRIPTS/contre-server.sh";;

    ' Raspi')
    exec alacritty -e "$TMUX_SCRIPTS/raspi.sh";;

    ' Android')
    exec alacritty -e "$TMUX_SCRIPTS/termux.sh";;
    
    ' Mac')
    exec alacritty -e "$TMUX_SCRIPTS/mac.sh";;
esac
