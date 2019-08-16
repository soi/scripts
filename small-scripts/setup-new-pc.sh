#! /bin/bash

./setup-git-config.sh
./gitpullall.py
sudo install-packages/install_packages desktop
sudo apt-get autoremove
./pip_install
./setup-vim.sh

./cp_scripts.py -m from-git

echo "sudo apt-get remove firefox thunderbird rhythmbox"
echo "have fun:)"
