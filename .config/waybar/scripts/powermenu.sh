#!/bin/bash

choice=$(printf "🔌 Power Off\n🔁 Reboot\n🔒 Lock\n👤 Switch User\n🚪 Logout\n❌ Cancel" | wofi --dmenu --width=250 --height=260 --prompt="System Menu" --style ~/.config/wofi/style.css)

case "$choice" in
  "🔌 Power Off")
    systemctl poweroff
    ;;
  "🔁 Reboot")
    systemctl reboot
    ;;
  "🔒 Lock")
    loginctl lock-session
    ;;
  "👤 Switch User")
    if command -v dm-tool &> /dev/null; then
      dm-tool switch-to-greeter
    elif command -v gdmflexiserver &> /dev/null; then
      gdmflexiserver
    else
      notify-send "Switch user is not available"
    fi
    ;;
  "🚪 Logout")
    hyprctl dispatch exit
    ;;
  "❌ Cancel" | "")
    exit 0
    ;;
  *)
    exit 1
    ;;
esac

chmod +x ~/.config/waybar/scripts/powermenu.sh

