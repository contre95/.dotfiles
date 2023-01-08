#!/bin/bash
source ~/.zshrc

choices="Any\nKeybr\nMedia\nBurp\nCronometer\nWhite\nNew Bookmark\nN26\nHome\nGalicia Contre\nGarmin\nMercadopago Contre\nGalicia Codelamp\nLichess\nInstagram\nMercadopago Codelamp\nYoutube\nTwitter\nDeemix\nTwitch"
chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#8F7DAB")

case "$chosen" in
"N26")
	exec brave --profile-directory="Contre" --app=https://app.n26.com/login
	;;
"White")
	exec brave --profile-directory="Contre" --app=https://blankwhitescreen.com/
	;;
"Keybr")
	exec brave --profile-directory="Contre" --app=https://www.keybr.com/
	;;
"Twitch")
	exec brave --profile-directory="Contre" --app=https://twitch.tv/
	;;
"Cronometer")
	exec brave --profile-directory="Contre" --app=https://cronometer.com/
	;;
"Deemix")
	exec brave --profile-directory="Contre" --app=http://localhost:6595
	;;
"Media")
	exec brave --profile-directory="Contre" --app=http://media.contre.io
	;;
"Youtube")
	exec brave --profile-directory="Contre" --app=https://youtube.com
	;;
"Lichess")
	exec brave --profile-directory="Contre" --app=https://lichess.org
	;;
"Twitter")
	exec brave --profile-directory="Contre" --app=https://twitter.com
	;;
"Home")
	exec brave --profile-directory="Contre" --app=http://home.contre.io
	;;
"Any")
	exec brave --app=http://"$(zenity --entry --text='Website  :')"
	;;
"New Bookmark")
   echo "$(zenity --entry --text='Bookmark:')"     - http://"$(zenity --entry --text='Website  :')" >> $MY_FOLDER/Info/bookmarks.txt 
	;;
"Galicia Contre")
	exec brave --profile-directory="Contre" --app=https://onlinebanking.bancogalicia.com.ar/login
	;;
"Galicia Codelamp")
	exec brave --profile-directory="Codelamp" --app=https://onlinebanking.bancogalicia.com.ar/login
	;;
"Garmin")
	exec brave --profile-directory="Contre" --app=https://connect.garmin.com/modern/
	;;
"Mercadopago Contre")
	exec brave --profile-directory="Contre" --app=https://www.mercadopago.com.ar/home
	;;
"Instagram")
	exec brave --profile-directory="Contre" --app=https://www.instagram.com
	;;
"Burp")
	exec brave --profile-directory="Burp" --proxy-server="http://127.0.0.1:8080"
	;;
"Mercadopago Codelamp")
	exec brave --profile-directory="Codelamp" --app=https://www.mercadopago.com.ar/home
	;;
esac
