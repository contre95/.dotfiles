

chosen=$(nmcli -t -f ssid dev wifi| cut -d\' -f2 | dmenu  -i -p "Connect Wifi: " -sb "#03396c")

nmcli dev wifi connect "$chosen"
