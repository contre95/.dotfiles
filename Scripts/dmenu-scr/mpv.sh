#!/bin/bash

choices=' Twitch\n YouTube\n Video'
var=$(echo -e $choices | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -i -p "Exit menu: " -sb "#9147FF" -fn "JetBrainsMono Nerd Font")

function screen_corner {
	bspc rule -a \* --one-shot state=floating layer=above rectangle="$SCR_CORNER" monitor="$(bspc query -M | sed -n 1p)"
}

case $var in
' Twitch')
	link="https://www.twitch.tv/$(zenity --entry --text="Twitch channel:")"
	streamlink --player mpv $link best
	;;
' YouTube')
    screen_corner &&
	query="$(zenity --entry --text='Search video')"
	if [ "$query" == "" ]; then exit; fi
	query=$(sed 's| |+|g' <<<$query)
	videoids=$(
		curl -s https://www.youtube.com/results?search_query=$query |
			grep -oP "\"videoRenderer\":{\"videoId\":\"...........\".+?\"text\":\".+?(?=\")" |
			awk -F\" '{ print $NF " | " $6}'
	)
    screen_corner &&
	while true; do
		videoid=$(
			echo -e "$videoids" |
				rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -l 10 -p "Pick Video: " -sb "#A52D2D" -fn "JetBrainsMono Nerd Font" | rev | cut -d'|' -f1 | rev | sed 's/ //g'
		)
		if [ "$videoid" == "" ]; then exit; fi
		mpv --ytdl-format="bestvideo[height<=?480]+bestaudio/best" https://youtu.be/$videoid
	done
	;;
' Video')
    screen_corner &&
	mpv av://v4l2:$(ls /dev/video* | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -i -p "Exit menu: " -sb "#9147FF" -fn "JetBrainsMono Nerd Font")
	;;
esac
