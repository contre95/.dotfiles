#!/bin/bash

SAVE_SCREENSHOT_PATH=~/Pictures/Screenshots/screen$(/bin/date +%Y%m%d-%H:%M:%S).png

import "$SAVE_SCREENSHOT_PATH" &&
  	notify-send "Screenshots saved" "$SAVE_SCREENSHOT_PATH" -i "$MY_FOLDER"/library/icons/display.png
