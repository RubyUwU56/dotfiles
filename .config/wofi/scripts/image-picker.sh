#!/bin/bash

# Verzeichnis mit Bildern
DIR="$HOME/Wallpapers"

# Unterstützte Formate
IMAGES=$(find "$DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \))

# Ausgabe für wofi (Pfad + Vorschau)
SELECTED=$(printf "%s\n" "$IMAGES" | while read -r img; do
    echo -e "$img\x00icon\x1f$img"
done | wofi --show dmenu --prompt "Search images..." --style ~/.config/wofi/image-picker.css)

# Wenn ein Bild gewählt wurde
if [[ -n "$SELECTED" ]]; then
    # Setze Wallpaper (z. B. mit swww)
    swww img "$SELECTED" --transition-type any

    # Wende pywal an
    wal -i "$SELECTED"

    # Wofi-Style aktualisieren
    ~/.config/wofi/generate_style.sh
fi
