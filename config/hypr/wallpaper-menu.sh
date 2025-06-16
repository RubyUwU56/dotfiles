#!/bin/bash

export WAYLAND_DISPLAY=wayland-1
WALLPAPER_DIR="$HOME/Wallpapers"

# Liste aller Wallpaper-Dateien
wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | \
    while read -r file; do
        echo "$file"
    done | wofi --show dmenu --prompt "Wallpaper wählen" --insensitive --width 800)

# Abbrechen?
[ -z "$wallpaper" ] && exit

# swww-daemon starten falls nicht läuft
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
    sleep 1
fi

# Wallpaper setzen
swww img "$wallpaper" \
    --transition-type grow \
    --transition-pos 0.5,0.5 \
    --transition-duration 1 \
    --transition-fps 60

notify-send "Wallpaper gesetzt" "$(basename "$wallpaper")"
