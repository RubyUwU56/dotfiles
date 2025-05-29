#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
player=$(playerctl -l 2>/dev/null | head -n1)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Player erkennen → Klasse setzen
if [[ "$player" == *spotify* ]]; then
class="spotify"
elif [[ "$player" == *firefox* || "$player" == *chromium* || "$player" == *brave* ]]; then
class="youtube"
else
class="music"
fi

echo "{\"text\": \"$artist - $title\", \"class\": \"$class\"}"
else
echo "{\"text\": \"\", \"class\": \"nomusic\"}"
fi


