#! /bin/bash

./setup-git-config.sh
./gitpullall.py
install-packages/install_packages desktop
./pip_install
./setup-vim.sh

./cp_scripts from-git

echo "sudo apt-get remove firefox thunderbird"
echo "have fun:)"
