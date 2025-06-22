#!/bin/bash

# Zufälliges Wallpaper aus ~/Wallpapers auswählen
WALLPAPER=$(ls ~/Wallpapers | shuf -n1)

# Wallpaper setzen mit swww
swww img ~/Wallpapers/"$WALLPAPER"

# Pywal Farben generieren
wal -i ~/Wallpapers/"$WALLPAPER"

# Waybar Farben aktualisieren und neu starten
~/.config/waybar/update-colors.sh
