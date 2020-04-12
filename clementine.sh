#! /bin/bash

set -uo pipefail
IFS=$'\n\t'

pgrep 'clementine' >/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  clementine &>/dev/null &
fi
