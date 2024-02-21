#!/bin/bash
printf "Installing dotfiles for %s\n" "$MYENV" 

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
			notify-send "Dotfiles updated" ":)" -i "$MY_FOLDER"/Library/icons/archlinux.png
		else
			echo "$d failed"
			notify-send "Dotfiles Error" "$d" -i "$MY_FOLDER"/Library/icons/error.png
		fi
	done
elif [[ $MYENV == "notebook" ]] || [[ $MYENV == "thinkbook" ]]; then
	for d in "${notebook[@]}"; do
		if stow "$d"; then
			echo "$d ok"
			notify-send "Dotfiles updated" "$d" -i "$MY_FOLDER"/Library/icons/archlinux.png
		else
			echo "$d failed"
			notify-send "Dotfiles Error" "$d" -i "$MY_FOLDER"/Library/icons/error.png
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
