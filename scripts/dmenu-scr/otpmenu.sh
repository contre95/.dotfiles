#!/usr/bin/env bash

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
	typeit=1
	shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=("$prefix"/**/OTP/*.gpg)
password_files=("${password_files[@]#"$prefix"/}")
password_files=("${password_files[@]%.gpg}")

password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p "OTP 󰅒 " "$@" -sb "#34495A" -fn "JetBrainsMono Nerd Font")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	pass otp -c "$password" 2>/dev/null
else
	pass otp "$password" | {
		IFS= read -r pass
		printf %s "$pass"
	} |
		xdotool type --clearmodifiers --file -
fi
cliphist list | head -n 1 | cliphist delete
