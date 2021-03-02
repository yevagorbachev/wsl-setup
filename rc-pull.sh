#!/bin/bash
read -p "Copy configuration files from repo to system [Y/N]?" -n 1 REPLY
if [[ $REPLY ~= ^[Yy]$ ]]
then
	cp ~/wsl-setup/auxiliary-files/.zsh_aliases ~/
	cp ~/wsl-setup/auxiliary-files/UltiSnips ~/vim/ -r
	cp ~/wsl-setup/auxiliary-files/ftplugin ~/.vim/ -r
	cp ~/wsl-setup/auxiliary-files/.vimrc ~/
fi
