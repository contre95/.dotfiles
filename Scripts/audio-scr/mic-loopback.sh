#!/bin/bash
mapfile -t LOOPBACKMODULES < <(pactl list short modules | awk '$2 =="module-loopback" { print $1 }') # mapfile is only available in bash>=4

if [[ ${#LOOPBACKMODULES[@]} -gt 0 ]]; then # 1 becaouse for some reason there's an empty something in the array (don't wanna bother)
	pactl list short modules | awk '$2 =="module-loopback" { print $1 }' | xargs -I {} -t pactl unload-module {}
else
	pactl load-module module-loopback latency_msec=1
fi
