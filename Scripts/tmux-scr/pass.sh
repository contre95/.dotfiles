PROJECT_FOLDER=/home/lucas/Code/CodeLamp/sys-codelamp-ims

function passwordstore {
    BASE="$PROJECT_FOLDER"
    tput setaf 3;
    
echo '           ad8888888888ba                                    '
echo '          dP          `"8b,                                  ' 
echo '         88  ,aaa,       "Y888a     ,aaaa,     ,aaa,  ,aa,   '
echo '        888  8` `8           "8baaaad""""baaaad""""baad""8b  ' 
echo '        888  8   8              """"      """"      ""    8b '   
echo '        888  8, ,8         ,aaaaaaaaaaaaaaaaaaaaaaaaddddd88P '  
echo '         88  `"""        ,d8""                               '  
echo '          Yb,         ,ad8"   PASSWORD MANAGER               ' 
echo '           "Y8888888888P"                                    '   
echo '                                                             '   

    tmux start-server
    tmux new-session -d -s Pass -n Pass
	
	tmux send-keys -t Codelamp:1 "cd $BASE && pass" C-m

    tmux attach-session -t Pass
}

passwordstore
