#!/bin/zsh
choices=" OpenSSH\n Docker\n Bluetooth\n Droidcam\n Deemix"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font") 

case $var in
    ' OpenSSH') 
    /usr/bin/systemct start sshd ;;
   
    ' Bluetooth')
    systemctl start bluetooth ;;
      
    ' Docker')
    systemctl start docker;;

    ' Droidcam')
    /usr/bin/droidcam-cli -v 192.168.1.192 4747 &;; 
    
    ' Deemix')
        /usr/bin/podman run -d --cap-add CAP_NET_RAW \
              --rm \
              --name DeTest \
              -v /home/canus/Music/:/deemix-gui/server/music \
              -v /home/contre/.config/deemix-server:/config \
              -p 6595:6595 \
              -it registry.gitlab.com/bockiii/deemix-docker bash
esac
