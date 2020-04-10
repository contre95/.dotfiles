#!/usr/bin/zsh
choices="OpenSSH\nDocker\nBluetooth"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9") 

case $var in
    'OpenSSH') 
    systemctl start sshd;; 
    
    'Bluetooth')
    systemctl start bluetooth ;;
      
    'Docker')
    systemctl start docker;;
esac
