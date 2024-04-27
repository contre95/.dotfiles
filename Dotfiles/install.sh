#!/bin/bash
printf "Installing dotfiles for %s\n" "$MYENV"

mac=(
	fzf
	zsh
	nvim
	tmux
	alacritty
)

notebook=(
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

server=(
	fzf
	gtk
	zsh
	hypr
	nvim
	rofi
	tmux
	dunst
	ranger
	waybar
	systemd
	pcmanfm
	keyboard
	alacritty
	wireplumber
)

desktop=(
	fzf
	gtk
	mpd
	zsh
	hypr
	cava
	mocp
	nvim
	rofi
	tmux
	gnupg
	dunst
	ranger
	waybar
	pcmanfm
	systemd
	zathura
	keyboard
	alacritty
	wireplumber
)

if [[ $MYENV == "desktop" ]]; then
	for d in "${desktop[@]}"; do
		if stow "$d"; then
			echo "$d ok"
		else
			echo "$d failed"
		fi
	done
elif [[ $MYENV == "notebook" ]] || [[ $MYENV == "thinkbook" ]]; then
	for d in "${notebook[@]}"; do
		if stow "$d"; then
			echo "$d ok"
		else
			echo "$d failed"
		fi
	done
elif [[ $MYENV == "mac" ]]; then
	for d in "${mac[@]}"; do
		if stow "$d"; then
			echo "$d ok"
		else
			echo "$d failed"
		fi
	done
elif [[ $MYENV == "server" ]]; then
	for d in "${server[@]}"; do
		if stow "$d"; then
			echo "$d ok"
		else
			echo "$d failed"
		fi
	done
fi
