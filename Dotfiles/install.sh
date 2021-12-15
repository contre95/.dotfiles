#!/bin/bash

dotfiles=(
	alacritty
	bspwm
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
	stow "$d" && notify-send "$d" "Succesfully updates" -i /usr/share/icons/Paper/16x16@2x/apps/git.png

done
