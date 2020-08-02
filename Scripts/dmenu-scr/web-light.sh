#!/bin/zsh
source ~/.zshrc
SCR_PATH=$MY_FOLDER/Scripts
choices="Galicia Contre\nMercadopago Contre\nGalicia Codelamp\nMercadopago Codelamp"

chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#FF5733")

case "$chosen" in
	"Galicia Contre")
        exec i3-msg 'exec brave --profile-directory="Contre" --app=https://onlinebanking.bancogalicia.com.ar/login';;
	"Galicia Codelamp")
        exec i3-msg 'exec brave --profile-directory="Codelamp" --app=https://onlinebanking.bancogalicia.com.ar/login';;
	"Mercadopago Contre")
        exec i3-msg 'exec brave --profile-directory="Contre" --app=https://www.mercadopago.com.ar/home';;
	"Mercadopago Codelamp")
        exec i3-msg 'exec brave --profile-directory="Codelamp" --app=https://www.mercadopago.com.ar/home';;
esac
