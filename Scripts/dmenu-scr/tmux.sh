#!/bin/bash

DMENU=${DMENU:-dmenu}

if [[ -f $HOME/.tmux/attach.list ]]; then
        . $HOME/.tmux/attach.list
fi

attach="$HOME/.tmux/tmux-attach"

tmux_run="$(tmux list-sessions -F '#S')"

prompt="attach-local:"

spawn_local() {
      tty -s || exec termite -e "zsh -c 'tmux a -t $1'"
    }

target=$(tmux list-sessions -F '#S' | dmenu -p "Tmux Sesions:" -sb "#2f8a47")

if [[ -n $target ]]; then
        spawn_local $target
fi
