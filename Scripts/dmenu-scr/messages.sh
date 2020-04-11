#!/bin/bash

choices="Telegram\nWhatsapp\nSignal\nDiscord\nSlack\nHangouts\nJitsi"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#85489d") 

case $var in
    'Whatsapp') 
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://web.whatsapp.com -class "messages"';;

    'Discord')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://discordapp.com/app';;

    'Jitsi')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://meet.jit.si/ContreMeet';;

    'Hangouts')
	  exec i3-msg 'exec brave --profile-directory="Contre" --app=https://hangouts.google.com/call';;

    'Telegram')
	  exec i3-msg 'exec telegram-desktop';;

    'Signal')
	  exec i3-msg 'exec signal-desktop';;
      
    'Slack')
	  exec i3-msg 'exec slack';;
esac
