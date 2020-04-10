#!/usr/bin/zsh
choices="Codelamp\nPass\nServer\nRaspi"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#2f8a47") 
TMUX_SCRIPTS=/home/lucas/Scripts/tmux-scr

case $var in
    'Codelamp') 
    exec termite -e "zsh $TMUX_SCRIPTS/ims.sh";;
    
    'Pass')
    exec termite -e "zsh $TMUX_SCRIPTS/pass.sh";;

    'Server')
    exec termite -e "zsh $TMUX_SCRIPTS/contre-server.sh";;

    'Raspi')
    exec termite -e "zsh $TMUX_SCRIPTS/raspi.sh";;
esac
