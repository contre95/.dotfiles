#!/bin/zsh
pacmd list-sinks | grep -A100 -i $(pactl get-default-sink) | grep 'device.description' | awk -F'"' '{print $2}' | head -n1
