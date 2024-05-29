#!/bin/zsh
bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done |grep -e 'Name\|Connected: yes' | grep  -B1 -e 'Connected: yes' | grep -e 'Name' | awk -F':' '{print $2}' | sed ':a;N;$!ba;s/\n/ |/g'
