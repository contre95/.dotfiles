#!/bin/bash

dotfiles=(
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
  alacritty
  pulseaudio
)

for d in "${dotfiles[@]}"; do
	if stow "$d"; then
		echo ok $d
	else
		echo no
	fi
done
