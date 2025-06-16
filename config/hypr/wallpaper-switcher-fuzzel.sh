#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"

# Stelle sicher, dass swww-daemon läuft
if ! pgrep -x swww-daemon >/dev/null; then
    swww-daemon &
    sleep 1
fi

# Hole alle Bilddateien im Wallpaper-Ordner
wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort | fuzzel --dmenu --prompt="Wallpaper:")

# Wenn Auswahl getroffen wurde
if [ -n "$wallpaper" ]; then
    swww img "$wallpaper" \
        --transition-type grow \
        --transition-pos 0.5,0.5 \
        --transition-duration 1 \
        --transition-fps 60
    notify-send "Wallpaper gewechselt zu:" "$(basename "$wallpaper")"
fi
