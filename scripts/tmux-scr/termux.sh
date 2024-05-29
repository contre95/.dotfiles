
function contreTermux {
    tmux start-server
    tmux new-session -d -s Android -n SSH
	
	tmux send-keys -t Android:1 "ssh -p 8022 u0_a235@192.168.0.192" C-m

    tmux attach-session -t Android
}

contreTermux
