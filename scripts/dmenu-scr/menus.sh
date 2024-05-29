#!/usr/bin/env bash

# rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  theming
. $HOME/.local/bin/rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi -theming

prompt="-p Run:"

rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi _run $prompt $lines $colors $font

