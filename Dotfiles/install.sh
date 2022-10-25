#!/bin/bash

dotfiles=(
  pulseaudio
  alacritty
  keyboard
  lemonbar
  barrier
  pcmanfm
  zathura
  ranger
  bspwm
  dunst
  sxhkd
  rofi
  tmux
  cava
  mocp
  nvim
  fzf
  gtk
  zsh
  mpd
)

for d in "${dotfiles[@]}"; do
	if stow "$d"; then
		notify-send "Dotfiles updated" ":)" -i "$MY_FOLDER"/Library/icons/archlinux.png
	else
		notify-send "Dotfiles Error" "$d" -i "$MY_FOLDER"/Library/icons/error.png
	fi
done
