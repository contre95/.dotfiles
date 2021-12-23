#!/bin/bash

choices=" Shutdown\n Lock\n Suspend\n Restart\n Logout\n Cancel"
var=$(echo -e "$choices" | dmenu -i -p "Exit menu: " -sb "#FF3855" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Shutdown') 
      "$MY_FOLDER"/Scripts/backup-scr/b4sd.sh > /home/contre/tmp.log || notify-send "Shutting down";;

    ' Lock')
      dm-tool lock ;;

    ' Restart')
      systemctl reboot;;

    ' Logout')
      dm-tool lock & pkill -9 bspwm;;
      
    ' Suspend')
      systemctl hibernate;;
    
	' Cancel')
      exit 0;;
esac
