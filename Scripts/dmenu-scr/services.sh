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
    /usr/bin/droidcam-cli -v 192.168.0.192 4747 &;; 
    
    ' Deemix')
    /usr/bin/podman run -d --cap-add CAP_NET_RAW \
              -v /home/canus/Music/:/downloads \
              -v /home/contre/.config/deemix-server:/config \
              -e PUID=1000 \
              -e PGID=1000 \
              -e ARL=1234567 \
              -e UMASK_SET=022 \
              -e DEEZUI=false \
              -p 6595:6595 \
              registry.gitlab.com/bockiii/deemix-docker;;

esac
