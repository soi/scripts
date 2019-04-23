#! /bin/bash

home="/home/felix"

if [ ! -d "$home/src" ]; then
	mkdir "$home/src"
fi
cd "$home/src"
git clone https://github.com/ctrlpvim/ctrlp.vim.git

if [ -d "$home/.vim" ]; then
	cp -r "$home/git/scripts/vim/*" "$home/.vim/"
else
	cp -r "$home/git/scripts/vim" "$home/.vim"
fi

echo "remember to run :helptags ~/src/ctrlp.vim/doc"
echo "and to run ctags -R"
echo "have fun :]"
