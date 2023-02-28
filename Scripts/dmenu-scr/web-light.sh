#!/bin/bash
# source ~/.zshrc

choices="Any\nKeybr\nTradingView\nMedia\nCronometer\nWhite\nNew Bookmark\nN26\nMonkeytype\nHome\nChatGPT\nGarmin\nLichess\nInstagram\nYoutube\nTwitter\nDeemix\nTwitch\nTranslate"
chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#8F7DAB")

# NOTE 
# Variable MOZ_USE_XINPUT2=1 should be setup in order for librefox not to launch this windows in fullscreen (at lead on bspwm) we need to set up 'full-screen-api.ignore-widgets' to `true` in the about:configexport  
# For touchscreen  also need to set 'dom.w3c.touch_events.enabled' to 1 in about:config
LW_PROFILE="ContreKiosk"
function screen_center { 
    bspc rule -a \* --one-shot state=floating layer=above rectangle="$SCR_CENTER" monitor="$(bspc query -M | sed -n 1p)" ;
}
function screen_corner { 
    bspc rule -a \* --one-shot state=floating layer=above rectangle="$SCR_CORNER" monitor="$(bspc query -M | sed -n 1p)" ;
}

declare -A  markets=(
    ["BTC|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BITSTAMP%3ABTCUSD"
    ["DOT|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BINANCE%3ADOTUSD"
    ["EUR|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=FX%3AEURUSD"
    ["US|INTR"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=ECONOMICS%3AUSINTR"
    ["ARS|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=FX_IDC%3AARSUSD"
    ["ETH|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=BITSTAMP%3AETHUSD"
    ["XMR|USD"]="https://www.tradingview.com/chart/rH3IToRa/?symbol=KRAKEN%3AXMRUSD"
)

case "$chosen" in
"Translate")
    librewolf --kiosk -P $LW_PROFILE --new-window "https://translate.google.com/?es=en"
	;;
"N26")
    librewolf --kiosk -P $LW_PROFILE --new-window https://app.n26.com/login
	;;
"TradingView")
    market=$(echo -e "${!markets[@]}" | tr ' ' '\n'| dmenu -i -p "Scripts" -sb "#40444B" -fn "JetBrainsMono Nerd Font")
    librewolf --kiosk -P $LW_PROFILE --new-window "${markets[$market]}"
	;;
"White")
    librewolf --kiosk -P $LW_PROFILE --new-window https://blankwhitescreen.com/
	;;
"Keybr")
    screen_center
    librewolf --kiosk -P $LW_PROFILE --new-window https://www.keybr.com/
	;;
"Monkeytype")
    screen_center
    librewolf --kiosk -P $LW_PROFILE --new-window https://www.monkeytype.com/
	;;
"Twitch")
    librewolf --kiosk -P $LW_PROFILE --new-window https://twitch.tv/
	;;
"Cronometer")
    screen_center
    librewolf --kiosk -P $LW_PROFILE --new-window https://cronometer.com/
	;;
"Deemix")
    librewolf --kiosk -P $LW_PROFILE --new-window http://dmusic.contre.io
	;;
"ChatGPT")
    librewolf --kiosk -P $LW_PROFILE --new-window https://chat.openai.com/chat
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
"Twitter")
    librewolf --kiosk -P $LW_PROFILE --new-window https://twitter.com
	;;
"Home")
    screen_center
    librewolf --kiosk -P $LW_PROFILE --new-window http://home.contre.io/home-dash/0
	;;
"Any")
    librewolf --kiosk -P $LW_PROFILE --new-window http://"$(zenity --entry --text='Website  :')"
	;;
"New Bookmark")
   echo "$(zenity --entry --text='Bookmark:')" - http://"$(zenity --entry --text='Website  :')" >> $MY_FOLDER/Info/bookmarks.txt 
	;;
"Garmin")
    screen_center
    librewolf --kiosk -P $LW_PROFILE --new-window https://connect.garmin.com/modern/
	;;
"Instagram")
    librewolf --kiosk -P $LW_PROFILE --new-window https://instagram.com
	;;
esac

