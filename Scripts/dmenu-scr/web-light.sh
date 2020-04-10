#!/bin/sh


SCR_PATH="/home/lucas/Scripts"

choices="Cronometer\nMercadolibre\nGoogle\nMercadopago\nGalicia Home Banking"

chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#FF5733")

case "$chosen" in
	"Cronometer") surf cronometer.com ;;
	"Mercadolibre") surf mercadolibre.com.ar;;
	"Google") surf google.com;;
	"Mercadopago") surf mercadopago.com.ar;;
	"Galicia Home Banking") surf https://onlinebanking.bancogalicia.com.ar/login ;;
esac
