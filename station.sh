#! /bin/bash

set -uo pipefail
IFS=$'\n\t'

readonly station_path=$(find "$HOME/.local/" -name 'Station*')

pgrep 'Station' >/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  if [[ -f "$station_path" ]]; then
    "$station_path" &>/dev/null &
  fi
fi
