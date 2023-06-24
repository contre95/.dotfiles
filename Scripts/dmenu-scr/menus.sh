#!/usr/bin/env bash

# dmenu -m DP-3 theming
. $HOME/.local/bin/dmenu -m DP-3-theming

prompt="-p Run:"

dmenu -m DP-3_run $prompt $lines $colors $font

