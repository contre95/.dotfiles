#!env bash

dotfiles=(
	fzf
	gtk
	zsh
	hypr
	nvim
	rofi
	tmux
	dunst
	picom
	ranger
	waybar
	systemd
	keyboard
	lemonbar
	alacritty
	autorandr
	wireplumber
)

for d in "${dotfiles[@]}"; do
	if stow -D "$d"; then
		echo $d
	else
		echo $d
	fi
done

