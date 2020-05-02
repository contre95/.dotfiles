#!/bin/bash

choices="Telegram\nWhatsapp\nSignal\nDiscord\nSlack\nHangouts\nJitsi\nGmail\nMessanger"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#85489d") 

case $var in
    'Whatsapp') 
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://web.whatsapp.com -class "messages"';;

    'Discord')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://discordapp.com/app';;

    'Jitsi')
        ASD="https://meet.jit.si/$(zenity --entry --text="Enter call name:")"
        echo $ASD | xclip -sel clip
        exec brave --profile-directory="Contre" --app=$ASD
        ;;

    'Hangouts')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://hangouts.google.com/call';;

    'Messanger')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://messanger.com';;
    
    'Gmail')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://gmail.com';;

    'Telegram')
	  exec i3-msg 'exec telegram-desktop';;

    'Signal')
	  exec i3-msg 'exec signal-desktop';;
      
    'Slack')
	  exec i3-msg 'exec slack';;
esac
