
function contreAnoux {
    tmux start-server
    tmux new-session -d -s Anoux -n SSH
	
	tmux send-keys -t Anoux:1 "ssh -p 8022 u0_a235@192.168.1.180" C-m

    tmux attach-session -t Anoux
}

contreAnoux

