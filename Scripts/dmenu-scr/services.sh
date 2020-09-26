#!/bin/zsh
choices=" OpenSSH\n Docker\n Bluetooth\n Droidcam"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font") 

case $var in
    ' OpenSSH') 
    /usr/bin/systemct start sshd ;;
   
    ' Bluetooth')
    systemctl start bluetooth ;;
      
    ' Docker')
    systemctl start docker;;

    ' Droidcam')
    /usr/bin/droidcam-cli -v 192.168.0.192 4747 &
esac
