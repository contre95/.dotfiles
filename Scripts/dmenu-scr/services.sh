#!/bin/zsh
choices=" OpenSSH\n Bluetooth\n Droidcam\n Remarkable"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font")

case $var in

' OpenSSH')
	systemctl start sshd
	;;

' Bluetooth')
	systemctl start bluetooth
	;;

' Droidcam')
	/usr/bin/droidcam-cli -v 192.168.1.192 4747 &
	;;

' Remarkable')
    eval $(ssh-agent -s)
    /usr/bin/ssh-add ~/.ssh/remarkable
	~/Applications/reStream/reStream.sh 2>~/templog
	;;

esac
