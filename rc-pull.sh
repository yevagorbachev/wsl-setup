#!/bin/bash
read -p "Copy configuration files from repo to system [y/n]: " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cp ~/wsl-setup/configs/. ~/ -r
fi
