#!/bin/bash
cd ~/dotfiles
git add .
git commit -m "Auto update $(date '+%Y-%m-%d %H:%M:%S')" || exit 0
git push
