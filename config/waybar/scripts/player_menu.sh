
#!/bin/bash

# Hole Infos via playerctl
TITLE=$(playerctl metadata xesam:title)
ARTIST=$(playerctl metadata xesam:artist)
STATUS=$(playerctl status)

# Spotify-ähnliches Menü via wofi
option=$(wofi --dmenu --width 400 --height 250 --prompt "🎵 $ARTIST – $TITLE [$STATUS]" <<EOF
⏯️  Play/Pause
⏭️  Next
⏮️  Previous
⏹️  Stop
EOF
)

# Aktion ausführen basierend auf Auswahl
case "$option" in
  "⏯️  Play/Pause") playerctl play-pause ;;
  "⏭️  Next") playerctl next ;;
  "⏮️  Previous") playerctl previous ;;
  "⏹️  Stop") playerctl stop ;;
esac

