#!/bin/bash

TEMPLATE="$HOME/.config/wofi/style_template.css"
OUT="$HOME/.config/wofi/style.css"
source "$HOME/.cache/wal/colors.sh"

# RGB aus hex für Hintergrund
bg_hex="${background:1}"
bg_r=$((16#${bg_hex:0:2}))
bg_g=$((16#${bg_hex:2:2}))
bg_b=$((16#${bg_hex:4:2}))

# Platzhalter ersetzen
sed -e "s/{background}/${bg_r}, ${bg_g}, ${bg_b}/g" \
    -e "s/{foreground}/${foreground:1}/g" \
    -e "s/{color1}/${color1:1}/g" \
    -e "s/{color4}/${color4:1}/g" \
    "$TEMPLATE" > "$OUT"
