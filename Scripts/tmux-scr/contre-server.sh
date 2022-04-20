#!/bin/bash

function contreserver {
	tmux start-server
	tmux new-session -d -s Server -n SSH

	tmux send-keys -t Server:1 "ssh contre@192.168.1.196" C-m

	tmux -u attach-session -t Server
}

contreserver
