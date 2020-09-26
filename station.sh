#! /bin/bash

set -uo pipefail
IFS=$'\n\t'

readonly station_browser='chromium-browser'

pgrep 'chromium' >/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  if hash "$station_browser"; then
    "$station_browser" &>/dev/null &
  fi
fi
