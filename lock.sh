#! /bin/bash
# lock the screen using i3lock and xautolock

if pgrep 'xautolock'; then
  killall xautolock
fi

xautolock -time 5 -locker "$HOME/.i3/i3lock-fancy/lock --pixelate --no-text"
