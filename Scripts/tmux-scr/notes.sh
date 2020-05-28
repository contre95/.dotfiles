PROJECT_FOLDER=/home/lucas/Notes

function passwordstore {
    BASE="$PROJECT_FOLDER"
    tput setaf 3;

    tmux start-server
    tmux new-session -d -s Notes -n Notes &&
	tmux send-keys -t Notes:1 "cd $BASE && gst" C-m
    tmux select-window -t Notes:1
    tmux -u attach-session -t Notes
}

passwordstore
