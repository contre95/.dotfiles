#!/bin/zsh
choices=" OpenSSH\n Bluetooth\n Droidcam\n Remarkable\n Barrier"
var=$(echo -e $choices | dmenu  -i -p "Exit menu: " -sb "#1ba4e9" -fn "JetBrainsMono Nerd Font")

case $var in

' OpenSSH')
	systemctl start sshd
	;;

' Bluetooth')
	systemctl start bluetooth
	;;

' Droidcam')
	/usr/bin/droidcam-cli -v 192.168.0.172 4747 &
	;;

' Barrier')
	barriers -f --no-tray  --disable-crypto --disable-client-cert-checking -c ~/.config/barrier/server/barrier.conf --address :24800 --restart &
	;;

' Remarkable')
    eval $(ssh-agent -s)
    /usr/bin/ssh-add ~/.ssh/remarkable
	~/Applications/reStream/reStream.sh 2>~/templog
	;;

esac
