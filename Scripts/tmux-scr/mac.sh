function macos{
    tput setaf 3;

    tmux start-server

    tmux new-session -d -s "  Mac " -n "  Mac " &&
	tmux send-keys -t "  Mac ":1 'sshuttle -r lcontreras@localhost:2210 0.0.0.0/0 -vvv' C-m &&

    tmux split-window -h -t "  Mac ":1
    tmux send-keys -t "  Mac ":1 'ssh lcontreras@localhost -p 2210' C-m &&
    resize-pane -L 110 &&
    
    tmux select-window -t "  Mac ":1
    tmux -u attach-session -t "  Mac "
}

macos
