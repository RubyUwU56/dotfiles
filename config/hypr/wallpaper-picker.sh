#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"

# swww-daemon starten wenn nicht läuft
if ! pgrep -x swww-daemon >/dev/null; then
    swww-daemon &
    sleep 1
fi

# Bildauswahl via yad
selected=$(yad --file-selection --title="Wallpaper wählen" \
    --file-filter="*.png *.jpg *.jpeg" \
    --filename="$WALLPAPER_DIR/" \
    --width=800 --height=600 \
    --center)

# Wenn Auswahl gültig ist
if [[ -f "$selected" ]]; then
    swww img "$selected" \
        --transition-type grow \
        --transition-pos 0.5,0.5 \
        --transition-duration 1 \
        --transition-fps 360
else
    notify-send "Wallpaper" "Keine gültige Auswahl getroffen."
fi
