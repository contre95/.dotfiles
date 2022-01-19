#!/bin/bash
maim -s --format=png /dev/stdout | xclip -selection clipboard -t image/png -i  && notify-send "Screenshot" "Copied to clipboard" -i "$MY_FOLDER"/Library/icons/display.png
