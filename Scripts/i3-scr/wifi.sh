#!/bin/sh
CONAME=$(echo "$1" | sed 's/ //g')
nmcli c add type wifi con-name $CONAME ifname '$3' ssid '$1'
nmcli con modify $CONAME wifi-sec.key-mgmt wpa-psk
nmcli con modify $CONAME wifi-sec.psk $2 
nmcli con up $CONAME || exit 1
echo Connected to $CONAME
