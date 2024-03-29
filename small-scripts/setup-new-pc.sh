#! /bin/bash

./setup-git-config.sh
./gitpullall.py
sudo install-packages/install_packages desktop
sudo apt-get autoremove
# ./pip_install
./setup-vim.sh

./cp_scripts.py -m from-git

dconf write /org/gnome/terminal/legacy/keybindings/next-tab "'<Shift>Right'"
dconf write /org/gnome/terminal/legacy/keybindings/prev-tab "'<Shift>Left'"

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P /home/felix/
bash /home/felix/Miniconda3-latest-Linux-x86_64.sh

echo -e "\nyou may want to run pip_install or install stuff via conda"
echo "maybe also run sudo apt-get remove firefox thunderbird rhythmbox"
echo "have fun:)"
