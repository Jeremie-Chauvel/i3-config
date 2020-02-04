#! /bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y i3 i3-ipc i3status i3lock dmenu xautolock kitty feh

# keyboard layout
curl -O http://marin.jb.free.fr/qwerty-fr/xkb-qwerty-fr_0.5_all.deb
sudo dpkg --install ./xkb-qwerty-fr_0.5_all.deb

git clone https://github.com/hastinbe/i3-volume.git ~/.i3/i3-volume
mkdir -p ~/.config/i3
for file in ./*
do
  ln "$file" ~/.config/i3/
done
