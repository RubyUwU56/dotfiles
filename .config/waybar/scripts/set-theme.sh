#!/bin/bash

# Wallpaper zufällig aus deinem Ordner
WALLPAPER=$(find ~/Wallpapers -type f | shuf -n1)
feh --bg-fill "$WALLPAPER"

# Farben generieren + anwenden
wal -i "$WALLPAPER"
~/.config/waybar/scripts/wal-to-css.sh

# Waybar neustarten
killall waybar && waybar &
