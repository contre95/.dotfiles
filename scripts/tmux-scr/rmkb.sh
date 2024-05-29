#!/bin/bash

function contreserver {
	tmux start-server
	tmux new-session -d -s Remarkable -n SSH

	tmux send-keys -t Remarkable:1 "ssh root@remarkable.wifi" C-m

	tmux -u attach-session -t Remarkable
}

contreserver
