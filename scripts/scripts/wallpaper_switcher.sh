#!/bin/bash

# Wallpaper Ordner
WALLPAPER_DIR="$HOME/Wallpapers"

# Auswahl via fuzzel
SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | fuzzel --dmenu)

# Abbrechen? (leere Auswahl)
[ -z "$SELECTED" ] && exit 0

# Setze Wallpaper mit swww (Wayland Wallpaper Setter)
swww img "$SELECTED" --transition-type any

# Extrahiere dominante Farben (z.B. mit pywal)
wal -i "$SELECTED"

# GTK-Theming aktualisieren (z.B. wenn Hyprland kompatibel)
gsettings set org.gnome.desktop.interface gtk-theme "$(cat ~/.cache/wal/sequences)" # Nur Beispiel!

# Reload bar (bei Waybar)
killall waybar && waybar &

# Hyprland reloaden (optional)
hyprctl reload
