#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"

# Stelle sicher, dass swww-daemon läuft
if ! pgrep -x swww-daemon >/dev/null; then
    swww-daemon &
    sleep 1
fi

# Erstelle eine Liste aller Bilder im Ordner
images=()
for img in "$WALLPAPER_DIR"/*.{png,jpg,jpeg}; do
    [[ -f "$img" ]] && images+=("$img")
done

# Wenn keine Bilder gefunden wurden
[[ ${#images[@]} -eq 0 ]] && notify-send "Wallpaper" "Keine Bilder gefunden!" && exit 1

# Temporäre Datei für Auswahl
tmpfile=$(mktemp)

# yad-Galerie-Fenster starten
yad --title="Wallpaper auswählen" \
    --image="$(basename "${images[0]}")" \
    --width=800 --height=600 \
    --center \
    --no-buttons \
    --text="Klicke ein Bild an:" \
    --icons --multiple --print-column=1 \
    --list --column="" "${images[@]}" > "$tmpfile"

selected="$(<"$tmpfile")"
rm "$tmpfile"

# Wenn Auswahl getroffen wurde
if [[ -n "$selected" && -f "$selected" ]]; then
    swww img "$selected" \
        --transition-type grow \
        --transition-pos 0.5,0.5 \
        --transition-duration 1 \
        --transition-fps 360
fi
