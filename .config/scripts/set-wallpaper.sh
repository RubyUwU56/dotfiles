#!/bin/bash

# swww-daemon starten, wenn nicht läuft
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
    sleep 1
fi

# Wallpaper auswählen / setzen
swww img /home/ruby/Wallpapers/overdose-kangel.png --transition-type any
