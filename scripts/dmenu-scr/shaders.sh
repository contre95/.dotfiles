#!/usr/bin/env bash
shadersPath=~/.config/hypr/shaders
shader="$(ls -1 $shadersPath | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -i -p 'Shader: ' -sb '#D96E1F' -fn 'JetBrainsMono Nerd Font')"
if [[ ! -z $shader ]]; then
    hyprctl keyword decoration:screen_shader "$shadersPath/$shader"
else
    hyprctl keyword decoration:screen_shader "[[EMPTY]]"
fi

