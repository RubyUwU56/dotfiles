#!/bin/bash

WALLPAPER_FILE="$HOME/.cache/current_wallpaper"

while true; do
    CURRENT=$(readlink -f "$WALLPAPER_FILE")
    LAST=$(cat /tmp/.last_wallpaper 2>/dev/null)

    if [ "$CURRENT" != "$LAST" ]; then
        echo "$CURRENT" > /tmp/.last_wallpaper
        wal -i "$CURRENT"
        pkill waybar && waybar &
    fi

    sleep 2
done
