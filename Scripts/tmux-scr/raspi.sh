
function contreRaspi {
    tmux start-server
    tmux new-session -d -s Raspi -n Server
	
	tmux send-keys -t Raspi:1 "ssh contre@192.168.0.194" C-m

    tmux attach-session -t Raspi
}

contreRaspi
