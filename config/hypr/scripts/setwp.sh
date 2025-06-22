#!/bin/bash

# 1. Wallpaper setzen mit swww
swww img "$1"

# 2. Pywal generieren (Farben und Terminal)
wal -i "$1"

# 3. Waybar CSS generieren
~/.config/hypr/scripts/generate-waybar-style.sh

# 4. Waybar neu laden
pkill -SIGUSR2 waybar
