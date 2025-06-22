#!/bin/bash

WALL="$1"

# Wallpaper setzen
swww img "$WALL" --transition-type any

# Farben setzen mit pywal
wal -i "$WALL"

# Waybar neustarten
pkill waybar && waybar &
