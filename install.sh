#! /bin/bash
set -euo pipefail
IFS=$'\n\t'

readonly i3_config_dir="$HOME/.config/i3"
sudo apt install -y i3 i3status i3lock dmenu xautolock feh

git clone https://github.com/Jeremie-Chauvel/i3-config.git ./
cd i3-config

# keyboard layout
set +e
sudo apt list --installed | grep 'xkb-qwerty' -q
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  curl -O http://marin.jb.free.fr/qwerty-fr/xkb-qwerty-fr_0.5_all.deb
  sudo dpkg --install ./xkb-qwerty-fr_0.5_all.deb
  rm xkb-qwerty-fr_0.5_all.deb
fi
if [[ ! -d "$HOME/.i3" ]]; then
  mkdir "$HOME/.i3"
fi

if [[ ! -d "$HOME/.i3/i3-volume" ]]; then
  git clone https://github.com/hastinbe/i3-volume.git "$HOME/.i3/i3-volume"
fi
# install i3lock-fancy
bash -c "$(curl -sSL https://raw.githubusercontent.com/Jeremie-Chauvel/i3lock-fancy/master/install.sh)"

if [[ ! -d "$i3_config_dir" ]]; then
  mkdir -p "$i3_config_dir"
fi

create_symbolic_link_with_backup() {
  local readonly file=${1:-config}
  if [[ -f "$i3_config_dir/$file" ]]; then
    mv "$i3_config_dir/$file" "$i3_config_dir/${file}.backup"
  fi
  ln -sr "$file" "$i3_config_dir/$file"
}

for file in ./*.sh; do
  create_symbolic_link_with_backup "$file"
done
create_symbolic_link_with_backup 'config'
