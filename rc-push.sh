#!/bin/bash
read -p "Copy configuration files from system to repo? [y/n]: " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "Copying ~/.zsh_aliases"
	cp ~/.zsh_aliases ~/wsl-setup/configs/
	echo "Copying ~/.vimrc"
	cp ~/.vimrc ~/wsl-setup/configs/
	echo "Copying select ./vim subdirs"
	cp ~/.vim/UltiSnips ~/wsl-setup/configs/.vim -r
	cp ~/.vim/ftplugin ~/wsl-setup/configs/.vim -r
fi
