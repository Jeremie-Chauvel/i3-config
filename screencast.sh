#!/bin/bash
TMPFILE="$(mktemp -t screencast-XXXXXXX).mkv"
OUTPUT="$HOME/Pictures/Screencasts/$(date +%F-%H-%M-%S)"
PALETTE="$(mktemp -t palette-XXXXXXX).png"
FILTERS="fps=15,scale=w=iw/2:-1:flags=lanczos"

if [[ ! -d "$HOME/Pictures/Screencasts" ]]; then
  mkdir -p "$HOME/Pictures/Screencasts"
fi

read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y "$TMPFILE"

notify-send 'generating palette'
ffmpeg -y -i "$TMPFILE" -vf fps=10,palettegen "$PALETTE"
notify-send 'generating gif'
ffmpeg -i "$TMPFILE" -i "$PALETTE" -lavfi "$FILTERS [x]; [x][1:v] paletteuse=dither=sierra2" "$OUTPUT.gif"

mv "$TMPFILE" "$OUTPUT.mkv"

notify-send "size $(du -h $OUTPUT.gif | awk '{print $1}')"
eog "$OUTPUT.gif"

trap "rm -f '$TMPFILE' '$PALETTE'" 0
