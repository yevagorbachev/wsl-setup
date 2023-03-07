# installations
sudo apt clean
sudo apt update
sudo apt upgrade -y

packages="tree python3 python3-pip texlive-base texlive-font-utils texlive-science texlive-extra-utils texlive-latex-extra latexmk sl gdb zsh sc-im"
sudo apt-get install $packages -y

#oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
sed 's/ZSH_THEME=\"[a-z]*\"/ZSH_THEME=\"afowler-custom\"/g' ~/.zshrc -i # set ZSH theme
cp ~/wsl-setup/auxiliary-files/afowler-custom.zsh-theme ~/.oh-my-zsh/themes/

# copy configuration files
cp ~/wsl-setup/configs/. ~/ -r

# add aliases
echo '. ~/.zsh_aliases' >> ~/.zshrc

# create project directory
mkdir ~/.projects

# VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
