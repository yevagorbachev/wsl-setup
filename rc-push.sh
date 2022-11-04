#!/bin/bash
read -p "Copy configuration files from system to repo? [y/n]: " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "--------Single configuration files-----------"
	cp ~/.zsh_aliases ~/wsl-setup/configs/ -v
	cp ~/.vimrc ~/wsl-setup/configs/ -v
	cp ~/.tmux.conf ~/wsl-setup/configs -v
	echo "---------Select .vim subdirectories----------"
	cp ~/.vim/UltiSnips ~/wsl-setup/configs/.vim -rv
	cp ~/.vim/ftplugin ~/wsl-setup/configs/.vim -rv
	cp ~/.vim/indent ~/wsl-setup/configs/.vim -rv
	cp ~/.vim/syntax ~/wsl-setup/configs/.vim -rv
fi
