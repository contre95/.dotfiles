#!/usr/bin/env bash

# Define the hosts
hosts=("desktop" "notebook" "server")

# Define the command to run
command="pushd \$MY_FOLDER && git pull && update"

# Create a new tmux session
tmux new-session -d -s mysession

# Loop over each host and create a new pane for each
for i in "${!hosts[@]}"; do
  if [ $i -eq 0 ]; then
    tmux send-keys "ssh contre@contre.${hosts[$i]}" C-m
    tmux send-keys "$command" C-m
  else
    tmux split-window -h
    tmux send-keys "ssh contre@contre.${hosts[$i]}" C-m
    tmux send-keys "$command" C-m
    tmux select-layout tiled
  fi
done

