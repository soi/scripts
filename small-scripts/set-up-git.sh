#! /bin/bash

sudo apt-get install git-core
git config --global user.email "felix.stiehler87@gmail.com"
git config --global user.name "Felix Stiehler"

# ssh-keygen
cat ~/.ssh/id_rsa.pub
echo "git clone git@github.com:soi/scripts.git"
