#!/bin/bash
  # source ~/.zshrc
PROJECT_FOLDER="$MY_FOLDER/Code/N26Code"

function n26tmux {
	BASE="$PROJECT_FOLDER"
	tput setaf 2
	echo '            _____                                                                       '
	echo '         _-~~     ~~-_                                                                  '
	echo '       /~             ~\                                                                '
	echo '      |              _  |_                                                              '
	echo '     |         _--~~~ )~~ )___                                                          '
	echo '    \|        /   ___   _-~   ~-_                                                       '
	echo '    \          _-~   ~-_         \                                                      '
	echo '    |         /         \         |                                                     '
	echo '    |        |           |     (O  |                                                    '
	echo '     |      |             |        |                                                    '
	echo '     |      |   O)        |       |                                                     '
	echo '     /|      |           |       /                                                      '
	echo '     / \ _--_ \         /-_   _-~)                                                      '
	echo '       /~    \ ~-_   _-~   ~~~__/                                                       '
	echo '      |   |\  ~-_ ~~~ _-~~---~  \                                                       '
	echo '      |   | |    ~--~~  / \      ~-_                                                    '
	echo '       |   \ |                      ~-_                                                 '
	echo '        \   ~-|                        ~~--__ _-~~-,             ▄▄▄·      ▄▄▌   ▄▄▄·   '
	echo '         ~-_   |                             /     |             ▐█ ▄█▪     ██•  ▐█ ▄█  '
	echo '            ~~--|                                 /               ██▀· ▄█▀▄ ██▪   ██▀·  '
	echo '              |  |                               /               ▐█▪·•▐█▌.▐▌▐█▌▐▌▐█▪·•  '
	echo '              |   |              _            _-~                .▀    ▀█▄▀▪.▀▀▀ .▀     '
	echo '              |  /~~--_   __---~~          _-~                                          '
	echo '              |  \                   __--~~                                             '
	echo '              |  |~~--__     ___---~~                                                   '
	echo '              |  |      ~~~~~                                                           '
	echo '              |  |                                                                      '
	echo '                                                                                        '
	echo '                                                                                        '
	echo '                                                                                        '
	# tmux start-server
	tmux new-session -d -s N26 -n IAC
	tmux new-window -t N26:2 -n Salt
	tmux new-window -t N26:3 -n Docker
	tmux new-window -t N26:4 -n Ingestors

	tmux send-keys -t N26:1 "pushd $BASE/sec26-iac && clear" C-m
	tmux send-keys -t N26:2 "pushd $BASE/section9_salt && clear" C-m
	tmux send-keys -t N26:3 "pushd $BASE/section9_docker && clear" C-m
	tmux send-keys -t N26:4 "pushd $BASE/sec26-log-ingestors && clear" C-m
	tmux select-window -t N26:1
	tmux -u attach-session -t N26
}

n26tmux
