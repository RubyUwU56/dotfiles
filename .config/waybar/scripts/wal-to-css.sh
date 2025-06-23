#!/bin/bash

WAL_JSON="$HOME/.cache/wal/colors.json"
OUTFILE="$HOME/.config/waybar/colors.css"

bg=$(jq -r '.colors.background' < "$WAL_JSON")
fg=$(jq -r '.colors.foreground' < "$WAL_JSON")
accent=$(jq -r '.colors.accent' < "$WAL_JSON")

cat > "$OUTFILE" <<EOF
:root {
  --background: $bg;
  --foreground: $fg;
  --accent:     $accent;
}
EOF
