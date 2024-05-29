#!/usr/bin/sh

if [ "$(dunstctl is-paused)" = "true" ] ;then
    dunstctl set-paused false &&
    notify-send "Notification" "muted toggle" -i "$MY_FOLDER"/library/icons/notif-on.png
else
    notify-send "Notification" "muting in 3s ..." -i "$MY_FOLDER"/library/icons/notif-off.png && sleep 3 &&
    dunstctl set-paused true
fi
