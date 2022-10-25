#!/bin/bash

dotfiles=(
  fzf
  gtk
  zsh
  mocp
  nvim
  rofi
  tmux
  bspwm
  dunst
  sxhkd
  ranger
  barrier
  pcmanfm
  zathura
  keyboard
  lemonbar
  newsboat
  alacritty
  pulseaudio
)

for d in "${dotfiles[@]}"; do
	if stow -D "$d"; then
		notify-send "Dotfiles updated" ":)" -i "$MY_FOLDER"/Library/icons/archlinux.png
	else
		notify-send "Dotfiles Error" "$d" -i "$MY_FOLDER"/Library/icons/error.png
	fi
done

