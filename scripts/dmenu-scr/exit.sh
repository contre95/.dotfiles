#!/usr/bin/env bash 

choices=" Shutdown\n Lock\n Suspend\n Restart\n Logout\n Cancel"
var=$(echo -e "$choices" | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -i -p "Exit menu: " -sb "#FF3855" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Shutdown') 
      $SCR_PATH/backup-scr/b4sd.sh && sleep 3 && systemctl poweroff;;

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
