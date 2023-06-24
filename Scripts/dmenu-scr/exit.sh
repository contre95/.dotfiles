#!/bin/bash

choices=" Shutdown\n Lock\n Suspend\n Restart\n Logout\n Cancel"
var=$(echo -e "$choices" | dmenu -m DP-3 -i -p "Exit menu: " -sb "#FF3855" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Shutdown') 
      /home/canus/Scripts/backup-scr/b4sd.sh && sleep 3 && systemctl poweroff;;

    ' Lock')
      dm-tool lock ;;

    ' Restart')
      systemctl reboot;;

    ' Logout')
      dm-tool lock & pkill -9 bspwm;;
      
    ' Suspend')
      systemctl suspend;;
    
	' Cancel')
      exit 0;;
esac
