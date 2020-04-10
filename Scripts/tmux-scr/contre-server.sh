
function contreserver {
    tmux start-server
    tmux new-session -d -s Server -n Server
	
	tmux send-keys -t Server:1 "ssh contre@192.168.0.193" C-m

    tmux attach-session -t Server
}

contreserver
