
function contreAnoux {
    tmux start-server
    tmux new-session -d -s Anoux -n SSH
	
	tmux send-keys -t Anoux:1 "ssh anoux@192.168.0.191" C-m

    tmux attach-session -t Anoux
}

contreAnoux

