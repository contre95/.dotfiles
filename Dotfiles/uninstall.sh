#!/bin/bash

dotfiles=(
	alacritty
	bspwm
	newsboat
	dunst
	fzf
	gtk
	keyboard
	lemonbar
	mocp
	nvim
	pcmanfm
	pulseaudio
	ranger
	rofi
	sxhkd
	tmux
	zathura
	zsh
)

for d in "${dotfiles[@]}"; do
	if stow -D "$d"; then
		notify-send "Dotfiles updated" ":)" -i "$MY_FOLDER"/Library/icons/archlinux.png
	else
		notify-send "Dotfiles Error" "$d" -i "$MY_FOLDER"/Library/icons/error.png
	fi
done

