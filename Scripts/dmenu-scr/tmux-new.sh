#!/usr/bin/zsh
choices=" Codelamp\nﴬ Notes\nﳳ Pass\n Server\n Raspi"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#2f8a47" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/lucas/Scripts/tmux-scr

case $var in
    ' Codelamp') 
    exec termite -e "$TMUX_SCRIPTS/ims.sh";;
    
    'ﴬ Notes')
    exec termite -e "zsh $TMUX_SCRIPTS/notes.sh";;
    
    'ﳳ Pass')
    exec termite -e "zsh $TMUX_SCRIPTS/pass.sh";;

    ' Server')
    exec termite -e "zsh $TMUX_SCRIPTS/contre-server.sh";;

    ' Raspi')
    exec termite -e "zsh $TMUX_SCRIPTS/raspi.sh";;
esac
