PROJECT_FOLDER=/home/lucas/Notes

function passwordstore {
    BASE="$PROJECT_FOLDER"
    tput setaf 3;

    tmux start-server
    tmux new-session -d -s Notes -n Notes
	
	tmux send-keys -t Codelamp:1 "cd $BASE && tree" C-m

    tmux attach-session -t Notes
}

passwordstore
