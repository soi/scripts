#! /bin/bash

sudo apt-get install git-core
./setup-git-config.sh

# ssh-keygen
cat ~/.ssh/id_rsa.pub
echo "git clone git@github.com:soi/scripts.git"
