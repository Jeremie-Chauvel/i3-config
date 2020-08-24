#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

declare -i ID
ID=$(xinput list | grep -Eio 'Touchpad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}')
declare -i STATE
STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')
if [[ "$STATE" -eq 1 ]]; then
  xinput disable "$ID"
  notify-send -t 500 'Touchpad disabled.'
else
  xinput enable "$ID"
  notify-send -t 500 'Touchpad enabled.'
fi
