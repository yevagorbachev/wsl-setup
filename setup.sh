#!/bin/bash
# installations
echo 'Installing packages'

sudo apt clean
sudo apt update
sudo apt upgrade -y

packages="tree python3 python3-pip texlive-base texlive-font-utils texlive-science texlive-extra-utils texlive-latex-extra latexmk sl gdb zsh sc-im"
sudo apt-get install $packages -y


