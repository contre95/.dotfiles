function music{
    tput setaf 3;

    tmux start-server
    tmux new-session -d -s Music -n Music &&
	tmux send-keys -t Music:1 'clyrics -m' C-m &&

    tmux split-window -h -t Music:1
	tmux send-keys -t Music:1 'mocp' C-m &&
    tmux resize-pane -L 35

    tmux select-window -t Music:1
    tmux -u attach-session -t Music
}

music

