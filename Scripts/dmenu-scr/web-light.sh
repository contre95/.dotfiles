#!/bin/bash
source ~/.zshrc

choices="Any\nKeybr\nTradingView\nMedia\nCronometer\nWhite\nNew Bookmark\nN26\nMonkeytype\nHome\nGalicia Contre\nChatGPT\nGarmin\nLichess\nInstagram\nYoutube\nTwitter\nDeemix\nTwitch"
chosen=$(echo -e "$choices" | dmenu -i -p "Select Layout: " -sb "#8F7DAB")

# NOTE 
#Variable MOZ_USE_XINPUT2=1 should be setup in order for librefox not to launch this windows in fullscreen (at lead on bspwm) we need to set up 'full-screen-api.ignore-widgets' to `true` in the about:configexport  # For touchscreen  also need to set 'dom.w3c.touch_events.enabled' to 1 in about:config
LW_PROFILE="ContreKiosk"

case "$chosen" in
"N26")
    librewolf --kiosk -P $LW_PROFILE --new-window https://app.n26.com/login
	;;
"TradingView")
    librewolf --kiosk -P $LW_PROFILE --new-window https://www.tradingview.com/chart/rH3IToRa/?symbol=BITSTAMP%3ABTCUSD
	;;
"White")
    librewolf --kiosk -P $LW_PROFILE --new-window https://blankwhitescreen.com/
	;;
"Keybr")
	exec brave --profile-directory="Contre" --app=https://www.keybr.com/
	;;
"Monkeytype")
	exec brave --profile-directory="Contre" --app=https://www.monkeytype.com/
	;;
"Twitch")
    librewolf --kiosk -P $LW_PROFILE --new-window https://twitch.tv/
	;;
"Cronometer")
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
    # librewolf --kiosk -P $LW_PROFILE --new-window http://home.contre.io/home-dash/0
	exec brave --profile-directory="Contre" --app=http://home.contre.io/home-dash/0
	;;
"Any")
    librewolf --kiosk -P $LW_PROFILE --new-window http://"$(zenity --entry --text='Website  :')"
	;;
"New Bookmark")
   echo "$(zenity --entry --text='Bookmark:')" - http://"$(zenity --entry --text='Website  :')" >> $MY_FOLDER/Info/bookmarks.txt 
	;;
"Garmin")
    librewolf --kiosk -P $LW_PROFILE --new-window https://connect.garmin.com/modern/
	;;
"Instagram")
    librewolf --kiosk -P $LW_PROFILE --new-window https://instagram.com
	;;
esac

