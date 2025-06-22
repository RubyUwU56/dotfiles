#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | \
    sort | wofi --dmenu --prompt "Wähle ein Wallpaper:")

if [ -n "$SELECTED" ]; then
    ~/.config/hypr/setwallpaper.sh "$SELECTED"
fi
