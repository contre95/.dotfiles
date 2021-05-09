#!/usr/bin/zsh
choices="ﰁ Polp\n Codelamp\nﳳ Pass\n Server\n Raspi\n Music\n Mac"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#2f8a47" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'ﰁ Polp') 
    exec termite -e "zsh $TMUX_SCRIPTS/polp.sh";;
    
    ' Codelamp') 
    exec termite -e "zsh $TMUX_SCRIPTS/ims.sh";;
    
    ' Music')
    exec termite -e "zsh $TMUX_SCRIPTS/music.sh";;

    'ﳳ Pass')
    exec termite -e "zsh $TMUX_SCRIPTS/pass.sh";;

    ' Server')
    exec termite -e "zsh $TMUX_SCRIPTS/contre-server.sh";;

    ' Raspi')
    exec termite -e "zsh $TMUX_SCRIPTS/raspi.sh";;
    
    ' Mac')
    exec termite -e "zsh $TMUX_SCRIPTS/mac.sh";;
esac
