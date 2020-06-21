#! /bin/bash
# lock the screen using i3lock and xautolock

set -uo pipefail
IFS=$'\n\t'

pgrep 'xautolock' >/dev/null
result_status="$?"
set -e
if [[ "$result_status" -eq 0 ]]; then
  killall xautolock
fi

xautolock -time 5 -locker "$HOME/.i3/i3lock-fancy/lock --pixelate --no-text"
