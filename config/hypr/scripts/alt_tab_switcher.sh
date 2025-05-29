#!/bin/bash

windows=$(hyprctl clients -j | jq -r '.[] | "\(.address) \(.app_id) \(.title)"')

selected=$(echo "$windows" | wofi --dmenu -i -p "Switch to window:" | awk '{print $1}')

if [ -n "$selected" ]; then
  hyprctl dispatch focuswindow address:$selected
fi
