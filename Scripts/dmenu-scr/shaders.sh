#!/bin/bash
shadersPath=~/.config/hypr/shaders
shader="$(find $shadersPath -type f -printf '%f\n' | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p 'Shader: ' -sb '#D96E1F' -fn 'JetBrainsMono Nerd Font')"

if [[ ! $shader -eq "" ]]; then
	hyprctl keyword decoration:screen_shader "$shadersPath/$shader"
else
	hyprctl keyword decoration:screen_shader "[[EMPTY]]" 
fi
