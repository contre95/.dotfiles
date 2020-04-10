#!/usr/bin/env bash
#
# Dmenu picker with sub entries
MY_FOLDER=/home/lucas
TMUX_SCRIPTS=$MY_FOLDER/Scripts/tmux-scr

GO_PROJECT_PATH=$MY_FOLDER/Code/ContreCode/go
#PYTHON_PROJECT_PATH=$MY_FOLDER/Code/ContreCode/python
#HTML_PROJECT_PATH=$MY_FOLDER/Code/ContreCode/html
#JS_PROJECT_PATH=$MY_FOLDER/Code/ContreCode/js
#MARKDOWN_PROJECT_PATH=$MY_FOLDER/Code/ContreCode/markdown/

options=("Go" "Python" "HTML" "Node" "Latex" "Markdown")
choice=$(printf "%s\n" "${options[@]}" | dmenu)
[ $? = 0 ] || exit

case $choice in
    "Go")
        project=$(ls "$GO_PROJECT_PATH" | dmenu)
        [ $? = 0 ] || exit
        tmux new-session -d -s GoProject -n Go
        tmux new-window -t GoProject -n $project
        tmux send-keys -t GoProject:$project "cd $GO_PROJECT_PATH/$project && nohup goland $GO_PROJECT_PATH/$project & clear " C-m
        exec termite -e "tmux attach-session -t GoProject"
        ;;
esac
