function rssfeed {
    tmux start-server
    tmux new-session -d -s RSS -n Newsboat
	tmux send-keys -t RSS:1 "newsboat" C-m

    tmux attach-session -t RSS
}

rssfeed
