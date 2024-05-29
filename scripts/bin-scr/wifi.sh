#!/usr/bin/zsh
nmcli connection delete "$1" 2> /dev/null
nmcli c add type wifi con-name "$1" ifname "$3" ssid "$1"
nmcli con modify "$1" wifi-sec.key-mgmt wpa-psk
nmcli con modify "$1" wifi-sec.psk "$2"
nmcli con up "$1"
