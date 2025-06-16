#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"
export WAYLAND_DISPLAY=wayland-1

# Starte nsxiv im Auswahlmodus
tmpfile=$(mktemp)

# Auswahl starten – bei Schließen wird Pfad in tmpfile geschrieben
nsxiv -t "$WALLPAPER_DIR" > "$tmpfile" &
wait $!

# Ausgewähltes Bild holen
selected=$(head -n 1 "$tmpfile")
rm "$tmpfile"

# Abbrechen?
[ -z "$selected" ] && exit

# Sicherstellen, dass swww-daemon läuft
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
    sleep 1
fi

# Wallpaper setzen
swww img "$selected" \
    --transition-type grow \
    --transition-pos 0.5,0.5 \
    --transition-duration 1 \
    --transition-fps 60

notify-send "Wallpaper gesetzt" "$(basename "$selected")"
