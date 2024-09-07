#!/usr/bin/env bash
#
# source ~/.zshrc

choices="Any\nKeybr\nDuolingo\nNotes\nTradingView\nMedia\nCronometer\nWhite\nSpotify\nDiscord\nN26\nFlights\nMonkeytype\nHome\nChatGPT\nGarmin\nLichess\nInstagram\nYoutube\nTwitter\nCoin 360\nMusic\nTwitch\nSpeedTest\nTranslate\nOpenAsistant"
chosen=$(echo -e "$choices" | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "Select Layout: " -sb "#8F7DAB")

# NOTE
# Variable MOZ_USE_XINPUT2=1 should be setup in order for librefox not to launch this windows in fullscreen (at lead on bspwm) we need to set up 'full-screen-api.ignore-widgets' to `true` in the about:configexport
# For touchscreen  also need to set 'dom.w3c.touch_events.enabled' to 1 in about:config
LW_PROFILE="ContreKiosk" # Beware that you should create a new librefox profile named "ContreKiosk" apart from the default one. One profile cannot hold both kiosk and regular windows at the same time.

side () {
  hyprctl dispatch exec "[size 800px 90%; animation slide right; move 76% 4%;fullscreen:0;] $1"
}

corner () {
  hyprctl dispatch exec "[size 24% 35%;animation slide; move 75%-20 60%-30;fullscreen:0;] $1"
}

center () {
  hyprctl dispatch exec "[fullscreen:0;size 70% 85%;animation slide;move 15%-30 3%;] $1"
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
  firefox --kiosk -P $LW_PROFILE --new-window "https://coin360.com/?period=24h"
	;;
"Discord")
  center "firefox --kiosk -P $LW_PROFILE --new-window 'https://discord.com/app'"
	;;
"Duolingo")
  center "firefox --kiosk -P $LW_PROFILE --new-window 'https://duolingo.com'"
	;;
"Spotify")
	firefox --kiosk -P $LW_PROFILE --new-window "https://open.spotify.com/"
	;;
"Translate")
	corner "firefox --kiosk -P $LW_PROFILE --new-window 'https://translate.google.com/?es=en'"
	;;
"SpeedTest")
	corner "firefox --kiosk -P $LW_PROFILE --new-window 'https://librespeed.org/'"
	;;
"Notes")
	firefox --kiosk -P $LW_PROFILE --new-window https://md.contre.io
	;;
"N26")
	firefox --kiosk -P $LW_PROFILE --new-window https://app.n26.com/login
	;;
"TradingView")
	market=$(echo -e "${!markets[@]}" | tr ' ' '\n' | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -i -p "Scripts" -sb "#40444B" -fn "JetBrainsMono Nerd Font")
    center "firefox --kiosk -P $LW_PROFILE --new-window \"${markets[$market]}\""
	;;
"White")
	firefox --kiosk -P $LW_PROFILE --new-window https://blankwhitescreen.com/
	;;
"Keybr")
	center "firefox --kiosk -P $LW_PROFILE --new-window https://www.keybr.com/"
	;;
"Monkeytype")
	center "firefox --kiosk -P $LW_PROFILE --new-window https://www.monkeytype.com/ "
	;;
"Twitch")
	firefox --kiosk -P $LW_PROFILE --new-window https://twitch.tv/
	;;
"Cronometer")
	firefox --kiosk -P $LW_PROFILE --new-window https://cronometer.com/
	;;
"Music")
	center "firefox --kiosk -P $LW_PROFILE --new-window http://192.168.0.174:6595"
	;;
"ChatGPT")
	corner "firefox --kiosk -P $LW_PROFILE --new-window https://chat.openai.com/chat"
	;;
"OpenAsistant")
	firefox --kiosk -P $LW_PROFILE --new-window https://open-assistant.io/chat
	;;
"Media")
	firefox --kiosk -P $LW_PROFILE --new-window http://media.contre.io
	;;
"Youtube")
	# In order for librefox not to launch this windows in fullscreen (at lead on bspwm) we need to set up full-screen-api.ignore-widgets to `true` in the about:config
	firefox --kiosk -P $LW_PROFILE --new-window https://youtube.com
	;;
"Lichess")
	firefox --kiosk -P $LW_PROFILE --new-window https://lichess.org
	;;
"Flights")
  firefox --kiosk -P $LW_PROFILE --new-window https://flightaware.com/live/flight/map/$(zenity --entry --text='Flight number:')
	;;
"Twitter")
	firefox --kiosk -P $LW_PROFILE --new-window https://twitter.com
	;;
"Home")
	side "firefox --kiosk -P $LW_PROFILE --new-window http://192.168.0.174:8123/home-dash/0"
	;;
"Any")
	firefox --kiosk -P $LW_PROFILE --new-window http://"$(zenity --entry --text='Website  :')"
	;;
"Garmin")
	center "firefox --kiosk -P $LW_PROFILE --new-window https://connect.garmin.com/modern/"
	;;
"Instagram")
	firefox --kiosk -P $LW_PROFILE --new-window https://instagram.com
	;;
esac
