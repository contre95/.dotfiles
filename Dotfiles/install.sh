#!/bin/bash
HOST=$(hostnamectl hostname)
printf "Installing dotfiles for %s\n" "$HOST" 

server=(
	fzf
	gtk
	zsh
	nvim
	rofi
	tmux
	bspwm
	dunst
	picom
	sxhkd
	ranger
	pcmanfm
	keyboard
	systemd
	alacritty
	autorandr
	pulseaudio
)

desktop=(
	fzf
	gtk
	mpd
	zsh
	cava
	mocp
	nvim
	rofi
	tmux
	bspwm
	dunst
	picom
	sxhkd
	ranger
	barrier
	pcmanfm
	zathura
	keyboard
	lemonbar
	systemd
	alacritty
	autorandr
	pulseaudio
)

if [[ $HOST == "archdesk" ]]; then
	for d in "${desktop[@]}"; do
		if stow "$d"; then
			echo "$d ok"
			notify-send "Dotfiles updated" ":)" -i "$MY_FOLDER"/Library/icons/archlinux.png
		else
			echo "$d failed"
			notify-send "Dotfiles Error" "$d" -i "$MY_FOLDER"/Library/icons/error.png
		fi
	done
elif [[ $HOST == "elsever" ]]; then
	for d in "${server[@]}"; do
		if stow "$d"; then
			echo "$d ok"
		else
			echo "$d failed"
		fi
	done
fi
