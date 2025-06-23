#!/bin/bash

# 💡 Wallpaper setzen
swww img "$1" --transition-type grow --transition-duration 0.7

# 🎨 Farben neu generieren mit pywal
wal -i "$1"

# 🔊 Cava neu starten mit pywal-Farbe
pkill cava
sleep 0.2
~/.config/cava/cava-auto-color.sh &
