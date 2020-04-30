PROJECT_FOLDER=/home/lucas/Code/CodeLamp/sys-codelamp-ims

function codelamptmux {
    BASE="$PROJECT_FOLDER"
    tput setaf 3;
    echo '                                                                                    '       
    echo '                                 /$$           /$$                                  '  
    echo '                                | $$          | $$                                  ' 
    echo '        /$$$$$$$  /$$$$$$   /$$$$$$$  /$$$$$$ | $$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$ ' 
    echo '       /$$_____/ /$$__  $$ /$$__  $$ /$$__  $$| $$ |____  $$| $$_  $$_  $$ /$$__  $$' 
    echo '      | $$      | $$  \ $$| $$  | $$| $$$$$$$$| $$  /$$$$$$$| $$ \ $$ \ $$| $$  \ $$' 
    echo '      | $$      | $$  | $$| $$  | $$| $$_____/| $$ /$$__  $$| $$ | $$ | $$| $$  | $$' 
    echo '      |  $$$$$$$|  $$$$$$/|  $$$$$$$|  $$$$$$$| $$|  $$$$$$$| $$ | $$ | $$| $$$$$$$/' 
    echo '       \_______/ \______/  \_______/ \_______/|__/ \_______/|__/ |__/ |__/| $$____/ ' 
    echo '                                                                          | $$      ' 
    echo '                                                                          | $$      ' 
    echo '                                                                          |__/      ' 
    echo '                                                                                    ' 
    tmux start-server
    tmux new-session -d -s Codelamp -n Project
    tmux new-window -t Codelamp:2 -n Code
    tmux new-window -t Codelamp:3 -n Database
    tmux new-window -t Codelamp:4 -n Server
    
    tmux send-keys -t Codelamp:1 "cd $BASE && clear" C-m
    tmux send-keys -t Codelamp:2 "cd $BASE && vim ." C-m
	tmux send-keys -t Codelamp:4 "cd $BASE &&  adonis serve --dev && clear" C-m
    tmux split-window -v -t Codelamp:4 "cd $BASE && docker-compose up" && sleep 5
	tmux send-keys -t Codelamp:3 "cd $BASE && mycli -P 3308 -u codelamp -pcodelamp --database clims && clear" C-m

    tmux select-window -t Codelamp:1
    tmux attach-session -t Codelamp
}

function codelampbrave {
    nohup /usr/bin/brave --profile-direcory="Codelamp" http://localhost:3333 &
}

codelamptmux
codelampbrave
