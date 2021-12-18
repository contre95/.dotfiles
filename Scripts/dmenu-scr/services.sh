#!/bin/zsh
choices=" OpenSSH\n Docker\n Bluetooth\n Droidcam\n Deemix\n Remarkable"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font") 

case $var in
    ' OpenSSH') 
    systemctl start sshd ;;
   
    ' Bluetooth')
    systemctl start bluetooth ;;
      
    ' Docker')
    systemctl start docker;;

    ' Droidcam')
    /usr/bin/droidcam-cli -v 192.168.1.192 4747 &;; 

    ' Remarkable')
     eval `ssh-agent -s` ;
    /usr/bin/ssh-add ~/.ssh/remarkable  ;
    ~/Applications/reStream/reStream.sh 2> ~/templog;;
    
    ' Deemix')
        /usr/bin/podman run -d --cap-add CAP_NET_RAW \
              --rm \
              -v /home/canus/Music/:/deemix-gui/server/music \
              -v /home/contre/.config/deemix-server:/config \
              -p 6595:6595 \
              registry.gitlab.com/bockiii/deemix-docker
esac
