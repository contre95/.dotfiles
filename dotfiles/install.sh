#!env bash

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
	waybar
	systemd
	keyboard
	alacritty
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

packages=()

case "$MYENV" in
mac) packages=("${mac[@]}") ;;
notebook | thinkbook) packages=("${notebook[@]}") ;;
server) packages=("${server[@]}") ;;
desktop) packages=("${desktop[@]}") ;;
*) echo "Wrong environment variable: 'MYENV'. Must be one of 'mac', 'server', 'notebook' or 'desktop'.";;
esac

if [[ "${#packages[@]}" -gt 0 ]]; then
	printf "Installing dotfiles for %s\n" "$MYENV"
	for package in "${packages[@]}"; do
		if stow "$package"; then
			echo "$package ok"
		else
			echo "$package failed"
		fi
	done
fi
