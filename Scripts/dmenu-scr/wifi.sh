

chosen=$(nmcli -t -f ssid dev wifi| cut -d\' -f2 | rofi -dmenu -theme $HOME/.config/rofi/dmenu.style.rasi  -i -p "Connect Wifi: " -sb "#03396c")

nmcli dev wifi connect "$chosen"
