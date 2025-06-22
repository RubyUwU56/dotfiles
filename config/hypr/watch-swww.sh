#!/bin/bash

# Letztes Bild merken
LAST_IMAGE=""

while true; do
    # Hole das aktuelle Hintergrundbild (swww speichert es leider nicht direkt)
    CURRENT_IMAGE=$(pgrep -a swww-daemon | grep -oP '(?<=--image\s)[^ ]+')

    # Wenn sich das Bild geändert hat
    if [ "$CURRENT_IMAGE" != "$LAST_IMAGE" ] && [ -f "$CURRENT_IMAGE" ]; then
        echo "Neues Wallpaper erkannt: $CURRENT_IMAGE"
        wal -i "$CURRENT_IMAGE"
        pkill waybar && waybar &>/dev/null &
        LAST_IMAGE="$CURRENT_IMAGE"
    fi

    sleep 2
done
