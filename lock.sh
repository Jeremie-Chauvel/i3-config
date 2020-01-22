#! /bin/bash
# lock the screen using i3lock and xautolock

if pgrep 'xautolock'; then
  killall xautolock
fi

xautolock -time 5  -locker "i3lock --ignore-empty-password --image=$HOME/Pictures/wallpaper.png --tiling"
