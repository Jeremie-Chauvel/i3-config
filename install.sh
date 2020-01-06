#! /bin/bash

sudo apt install i3 i3-ipc i3status i3lock dmenu xautolock
git clone https://github.com/hastinbe/i3-volume.git ~/.i3/i3-volume
mkdir -p ~/.config/i3
ln config ~/.config/i3/
