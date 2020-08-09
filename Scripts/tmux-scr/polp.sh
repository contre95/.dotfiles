source ~/.zshrc
PROJECT_FOLDER=$MY_FOLDER/Code/MeliCode/polp/polp-fiction

function polptmux {
    BASE="$PROJECT_FOLDER"
    tput setaf 2;
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
    tmux start-server
    tmux new-session -d -s Polp -n Project
    tmux new-window -t Polp:2 -n Code
    tmux new-window -t Polp:3 -n Database
    tmux new-window -t Polp:4 -n Server
    
    tmux send-keys -t Polp:1 "cd $BASE && clear" C-m
    tmux send-keys -t Polp:2 "cd $BASE && vim" C-m
	tmux send-keys -t Polp:4 "cd $BASE && flask run" C-m
    tmux split-window -v -t Polp:4 "cd $BASE && docker-compose up -d mysql" && sleep 5
	tmux send-keys -t Polp:3 "cd $BASE && mycli -P 3308 -u polpuser -ppolpsecret --database polpdb && clear" C-m

    tmux select-window -t Polp:1
    tmux -u attach-session -t Polp

}

polptmux
