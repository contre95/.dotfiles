#!/bin/bash

choices=" Shutdown\n Lock\n Suspend\n Restart\n Logout\n Cancel"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#FF3855" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Shutdown') 
	  systemctl poweroff;;

    ' Lock')
        /usr/bin/i3lock -c '#000000';;

    ' Restart')
      systemctl reboot;;

    ' Logout')
      i3exit logout;;
      
    ' Suspend')
      systemctl hibernate;;
    
	' Cancel')
      exit 0;;
esac
