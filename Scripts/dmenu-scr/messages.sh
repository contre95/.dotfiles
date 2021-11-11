#!/bin/bash

choices=' Telegram\n Whatsapp\n Signal\nﭮ Discord\n Slack\n Hangouts\n Jitsi\n Gmail\n Messenger'
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#137aad" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Whatsapp') 
	  exec 'brave --profile-directory="Contre" --app=https://web.whatsapp.com -class "messages"';;

    'ﭮ Discord')
	  exec 'discord';;

    ' Jitsi')
        URL="https://meet.jit.si/$(zenity --entry --text="Enter call name:")"
        echo $URL | xclip -sel clip
        exec brave --profile-directory="Contre" --app=$URL
        ;;

    ' Hangouts')
	  exec 'brave --profile-directory="Contre" --app=https://hangouts.google.com/call';;

    ' Messenger')
	  exec 'brave --profile-directory="Contre" --app=https://messenger.com';;
    
    ' Gmail')
	  exec 'brave --profile-directory="Contre" --app=https://gmail.com';;

    ' Telegram')
	  exec 'telegram-desktop';;

    ' Signal')
	  exec 'signal-desktop';;
      
    ' Slack')
	  exec 'slack';;
esac
