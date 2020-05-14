#!/usr/bin/zsh
choices=" OpenSSH\n Docker\n Bluetooth"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font") 

case $var in
    ' OpenSSH') 
    exec systemctl start sshd;; 
    
    ' Bluetooth')
    sudo systemctl start bluetooth ;;
      
    ' Docker')
    sudo ystemctl start docker;;
esac
