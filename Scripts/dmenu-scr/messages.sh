#!/bin/bash

choices="Telegram\nWhatsapp\nSignal\nDiscord\nSlack"
var=$(echo -e $choices | dmenu -i -p "Exit menu: " -sb "#85489d") 

case $var in
    'Whatsapp') 
	  exec i3-msg 'workspace Messages; exec brave --profile-directory="Contre" --app=https://web.whatsapp.com';;

    'Discord')
	  exec i3-msg 'workspace Messages; exec brave --profile-directory="Contre" --app=https://discordapp.com/app';;

    'Telegram')
	  exec i3-msg 'workspace Messages; exec telegram-desktop';;

    'Signal')
	  exec i3-msg 'workspace Messages; exec signal-desktop';;
      
    'Slack')
	  exec i3-msg 'workspace Messages; exec slack';;
esac
