#!/bin/bash

# Let user choose a WiFi network using wofi
selected=$(nmcli -t -f SSID dev wifi list | awk -F: '!seen[$0]++' | wofi --dmenu --prompt="Select WiFi")

# If a selection was made, try to connect
if [ -n "$selected" ]; then
    nmcli device wifi connect "$selected"
fi

chmod +x ~/.config/waybar/scripts/wifi_menu.sh

