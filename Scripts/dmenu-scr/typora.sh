#!/usr/bin/zsh
source ~/.zshrc
choices="ﴬ Contre\nﴬ Meli"
var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Notes: " -sb "#2f4a47" -fn "JetBrainsMono Nerd Font") 
TMUX_SCRIPTS=/home/canus/Scripts/tmux-scr

case $var in
    'ﴬ Contre')
    exec /usr/lib/marktext/marktext $MY_FOLDER/Notes/ContreNotes;;
    'ﴬ Meli')
    exec /usr/lib/marktext/marktext $MY_FOLDER/Notes/MeliNotes;;

esac
