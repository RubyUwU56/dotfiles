#!/bin/bash

FILE=$(find ~/Pictures -type f \( -iname '*.jpg' -o -iname '*.png' \) | fuzzel --dmenu)
[ -n "$FILE" ] && imv "$FILE"
