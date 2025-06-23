#!/bin/bash

# Kopiere die fertige colors.css einfach in den Waybar-Ordner
cp ~/.cache/wal/colors.css ~/.config/waybar/colors.css

# Waybar neu starten, damit die Farben geladen werden
pkill waybar
waybar &
