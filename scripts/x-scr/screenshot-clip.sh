#!/bin/bash
maim -s --format=jpg /dev/stdout | xclip -selection clipboard -t image/png -i  && notify-send "Screenshot" "Copied to clipboard" -i "$MY_FOLDER"/library/icons/display.png
