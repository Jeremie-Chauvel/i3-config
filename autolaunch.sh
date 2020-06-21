#!/usr/bin/env bash
# launch given program if not already launched
set -euo pipefail
IFS=$'\n\t'

for program in "$@"; do
  if [[ ! -z "$program" ]]; then
    set +e
    pgrep "$program" >/dev/null
    result_status="$?"
    set -e
    if [[ "$result_status" -gt 0 ]]; then
      set +e
      "$program" &>/dev/null &
      set -e
    fi
  fi
done
