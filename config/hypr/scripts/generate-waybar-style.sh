#!/bin/bash

COLORFILE="$HOME/.cache/wal/colors.css"
STYLEFILE="$HOME/.config/waybar/style.css"

# Lese Farben aus colors.css raus (aus pywal)
BG=$(grep --color=never --only-matching '#[0-9a-fA-F]\{6\}' $COLORFILE | sed -n 1p)
FG=$(grep --color=never --only-matching '#[0-9a-fA-F]\{6\}' $COLORFILE | sed -n 2p)
COLOR4=$(grep --color=never --only-matching '#[0-9a-fA-F]\{6\}' $COLORFILE | sed -n 5p)
COLOR5=$(grep --color=never --only-matching '#[0-9a-fA-F]\{6\}' $COLORFILE | sed -n 6p)
COLOR1=$(grep --color=never --only-matching '#[0-9a-fA-F]\{6\}' $COLORFILE | sed -n 3p)

cat > $STYLEFILE << EOF
* {
  font-family: "JetBrainsMono Nerd Font", monospace;
  font-size: 13px;
  border: none;
  box-shadow: none;
  margin: 0;
  padding: 0;
}

#waybar {
  display: flex;
  background-color: $BG;
  padding: 6px 12px;
  gap: 10px;
}

#workspaces button,
#clock,
#battery,
#cpu,
#memory,
#pulseaudio,
#network,
#tray,
#custom-launcher {
  padding: 6px 14px;
  border-radius: 12px;
  background-color: $COLOR5;
  color: $FG;
  transition: background-color 0.3s ease, color 0.3s ease;
  cursor: default;
  user-select: none;
}

#workspaces button.active {
  background-color: $COLOR4;
  color: $BG;
  font-weight: 600;
}

#workspaces button:hover {
  background-color: $COLOR1;
  color: $BG;
}

#battery.warning,
#pulseaudio.muted,
#network.disconnected {
  background-color: $COLOR1;
  color: $BG;
  font-weight: 600;
}

tooltip {
  background: $COLOR5;
  color: $FG;
  border-radius: 6px;
  padding: 5px 10px;
  font-size: 12px;
}
EOF
