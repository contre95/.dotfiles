#!/bin/bash

choices="Telegram\nWhatsapp\nSignal\nDiscord\nSlack\nHangouts\nJitsi\nGmail\nMessenger"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#0384fc") 

case $var in
    'Whatsapp') 
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://web.whatsapp.com -class "messages"';;

    'Discord')
	  exec i3-msg 'exec discord';;

    'Jitsi')
        ASD="https://meet.jit.si/$(zenity --entry --text="Enter call name:")"
        echo $ASD | xclip -sel clip
        exec brave --profile-directory="Contre" --app=$ASD
        ;;

    'Hangouts')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://hangouts.google.com/call';;

    'Messenger')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://messenger.com';;
    
    'Gmail')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://gmail.com';;

    'Telegram')
	  exec i3-msg 'exec telegram-desktop';;

    'Signal')
	  exec i3-msg 'exec signal-desktop';;
      
    'Slack')
	  exec i3-msg 'exec slack';;
esac
