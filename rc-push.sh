#!/bin/bash
read -p "Copy configuration files from system to repo? [y/n]: " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	cp ~/.vim/ftplugin ~/wsl-setup/auxiliary-files/ -r
	cp ~/.vim/UltiSnips ~/wsl-setup/auxiliary-files/ -r
	cp ~/.zsh_aliases ~/wsl-setup/auxiliary-files
	cp ~/.vimrc ~/wsl-setup/auxiliary-files
fi
