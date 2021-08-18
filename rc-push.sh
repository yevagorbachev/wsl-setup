#!/bin/bash
read -p "Copy configuration files from system to repo? [y/n]: " -n 1 REPLY
echo
if [[ $REPLY =~ '^[Yy]$' ]]; then
	cp ~/.zsh_aliases ~/wsl-setup/configs/
	cp ~/.vimrc ~/wsl-setup/configs/
	cp ~/.vim/UltiSnips ~/wsl-setup/configs/.vim -r
	cp ~/.vim/ftplugin ~/wsl-setup/configs/.vim -r
fi
