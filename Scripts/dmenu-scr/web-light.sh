#!/bin/bash
#
# source ~/.zshrc

choices="Any\nKeybr\nDuolingo\nTradingView\nMedia\nCronometer\nWhite\nSpotify\nNew Bookmark\nN26\nFlights\nMonkeytype\nHome\nChatGPT\nGarmin\nLichess\nInstagram\nPNL\nYoutube\nTwitter\nCoin 360\nMusic\nTwitch\nSpeedTest\nTranslate\nOpenAsistant"
chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#8F7DAB")

# NOTE
# Variable MOZ_USE_XINPUT2=1 should be setup in order for librefox not to launch this windows in fullscreen (at lead on bspwm) we need to set up 'full-screen-api.ignore-widgets' to `true` in the about:configexport
# For touchscreen  also need to set 'dom.w3c.touch_events.enabled' to 1 in about:config
LW_PROFILE="ContreKiosk" # Beware that you should create a new librefox profile named "ContreKiosk" apart from the default one. One profile cannot hold both kiosk and regular windows at the same time.

function screen_center {
	bspc rule -a \* --one-shot state=floating layer=above rectangle="$SCR_CENTER" monitor="$(bspc query -M | sed -n 2p)"
}

function screen_corner {
	bspc rule -a \* --one-shot state=floating layer=above rectangle="$SCR_CORNER"
}

side () {
  hyprctl dispatch exec "[float;size 800px 94%; animation slide right; move 76% 4%] $1"
}

corner () {
  hyprctl dispatch exec "[float;size 24% 35%;animation slide; move 75%-20 60%-30] $1"
}

center () {
  hyprctl dispatch exec "[float;size 70% 85%;animation slide;move 15%-30 3%] $1"
}

declare -A markets=(
	["TRX|USDT"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BINGX%3ATRXUSDT"
	["BTC|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BITSTAMP%3ABTCUSD"
	["DOT|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BINANCE%3ADOTUSD"
	["INDX|DXY"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=TVC%3ADXY"
	["INDX|SP500"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=SP%3ASPX"
	["EUR|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=FX%3AEURUSD"
	["US|INTR"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=ECONOMICS%3AUSINTR"
	["EU|INTR"]="https://www.tradingview.com/chart/?symbol=ECONOMICS%3AEUINTR"
	["MELI|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=NASDAQ%3AMELI"
	["ARS|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=FX_IDC%3AARSUSD"
	["ETH|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BITSTAMP%3AETHUSD"
	["XMR|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=KRAKEN%3AXMRUSD"
)


case "$chosen" in
"Coin 360")
	librewolf --kiosk -P $LW_PROFILE --new-window "https://coin360.com/?period=24h"
	;;
"Duolingo")
  center "librewolf --kiosk -P $LW_PROFILE --new-window 'https://duolingo.com'"
	;;
"Spotify")
	librewolf --kiosk -P $LW_PROFILE --new-window "https://open.spotify.com/"
	;;
"Translate")
	corner "librewolf --kiosk -P $LW_PROFILE --new-window 'https://translate.google.com/?es=en'"
	;;
"SpeedTest")
	corner "librewolf --kiosk -P $LW_PROFILE --new-window 'https://librespeed.org/'"
	;;
"PNL")
	librewolf --kiosk -P $LW_PROFILE --new-window https://docs.google.com/spreadsheets/d/1v_JZ9QqCnBhPOOXPrl6OE26kyl6XZRzJNjMs27UY8BA
	;;
"N26")
	librewolf --kiosk -P $LW_PROFILE --new-window https://app.n26.com/login
	;;
"TradingView")
	market=$(echo -e "${!markets[@]}" | tr ' ' '\n' | dmenu  -i -p "Scripts" -sb "#40444B" -fn "JetBrainsMono Nerd Font")
    center "librewolf --kiosk -P $LW_PROFILE --new-window \"${markets[$market]}\""
	;;
"White")
	librewolf --kiosk -P $LW_PROFILE --new-window https://blankwhitescreen.com/
	;;
"Keybr")
	center "librewolf --kiosk -P $LW_PROFILE --new-window https://www.keybr.com/"
	;;
"Monkeytype")
	center "librewolf --kiosk -P $LW_PROFILE --new-window https://www.monkeytype.com/ "
	;;
"Twitch")
	librewolf --kiosk -P $LW_PROFILE --new-window https://twitch.tv/
	;;
"Cronometer")
	librewolf --kiosk -P $LW_PROFILE --new-window https://cronometer.com/
	;;
"Music")
	center "librewolf --kiosk -P $LW_PROFILE --new-window http://192.168.0.174:6595"
	;;
"ChatGPT")
	librewolf --kiosk -P $LW_PROFILE --new-window https://chat.openai.com/chat
	;;
"OpenAsistant")
	librewolf --kiosk -P $LW_PROFILE --new-window https://open-assistant.io/chat
	;;
"Media")
	librewolf --kiosk -P $LW_PROFILE --new-window http://media.contre.io
	;;
"Youtube")
	# In order for librefox not to launch this windows in fullscreen (at lead on bspwm) we need to set up full-screen-api.ignore-widgets to `true` in the about:config
	librewolf --kiosk -P $LW_PROFILE --new-window https://youtube.com
	;;
"Lichess")
	librewolf --kiosk -P $LW_PROFILE --new-window https://lichess.org
	;;
"Flights")
  librewolf --kiosk -P $LW_PROFILE --new-window https://flightaware.com/live/flight/map/$(zenity --entry --text='Flight number:')
	;;
"Twitter")
	librewolf --kiosk -P $LW_PROFILE --new-window https://twitter.com
	;;
"Home")
	side "librewolf --kiosk -P $LW_PROFILE --new-window http://192.168.0.174:8123/home-dash/0"
	;;
"Any")
	librewolf --kiosk -P $LW_PROFILE --new-window http://"$(zenity --entry --text='Website  :')"
	;;
"New Bookmark")
	echo "$(zenity --entry --text='Bookmark:')             - http://$(zenity --entry --text='URL:')" >>"$MY_FOLDER"/Info/bookmarks.txt
	;;
"Garmin")
	center "librewolf --kiosk -P $LW_PROFILE --new-window https://connect.garmin.com/modern/"
	;;
"Instagram")
	librewolf --kiosk -P $LW_PROFILE --new-window https://instagram.com
	;;
esac
