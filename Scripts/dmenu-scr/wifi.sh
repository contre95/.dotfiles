

chosen=$(nmcli -t -f ssid dev wifi| cut -d\' -f2 | dmenu -m DP-3 -i -p "Connect Wifi: " -sb "#03396c")

nmcli dev wifi connect "$chosen"
