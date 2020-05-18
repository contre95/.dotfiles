#!/bin/bash

choices=' Telegram\n Whatsapp\n Signal\nﭮ Discord\n Slack\n Hangouts\n Jitsi\n Gmail\n Messenger'
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#137aad" -fn "JetBrainsMono Nerd Font" ) 

case $var in
    ' Whatsapp') 
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://web.whatsapp.com -class "messages"';;

    'ﭮ Discord')
	  exec i3-msg 'exec discord';;

    ' Jitsi')
        ASD="https://meet.jit.si/$(zenity --entry --text="Enter call name:")"
        echo $ASD | xclip -sel clip
        exec brave --profile-directory="Contre" --app=$ASD
        ;;

    ' Hangouts')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://hangouts.google.com/call';;

    ' Messenger')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://messenger.com';;
    
    ' Gmail')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://gmail.com';;

    ' Telegram')
	  exec i3-msg 'exec telegram-desktop';;

    ' Signal')
	  exec i3-msg 'exec signal-desktop';;
      
    ' Slack')
	  exec i3-msg 'exec slack';;
esac
