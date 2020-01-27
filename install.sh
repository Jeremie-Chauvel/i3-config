#! /bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y i3 i3-ipc i3status i3lock dmenu xautolock kitty feh
git clone https://github.com/hastinbe/i3-volume.git ~/.i3/i3-volume
mkdir -p ~/.config/i3
for file in ./*
do
  ln "$file" ~/.config/i3/
done
