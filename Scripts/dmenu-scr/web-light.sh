#!/bin/bash
source ~/.zshrc
SCR_PATH=$MY_FOLDER/Scripts

choices="Any\nKeybr\nBurp\nN26\nGalicia Contre\nGarmin\nMercadopago Contre\nGalicia Codelamp\nLichess\nInstagram\nMercadopago Codelamp\nYoutube\nTwitter\nDeemix"
chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#8F7DAB")

case "$chosen" in
"N26")
	exec brave --profile-directory="Contre" --app=https://app.n26.com/login
	;;
"Keybr")
	exec brave --profile-directory="Contre" --app=https://www.keybr.com/
	;;
"Deemix")
	exec brave --profile-directory="Contre" --app=http://localhost:6595
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
"Any")
	exec brave --app=http://"$(zenity --entry --text='Website  :')"
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
