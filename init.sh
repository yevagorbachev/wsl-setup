# installations
sudo apt clean
sudo apt update
sudo apt upgrade -y
sudo apt-get install tree -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo apt-get install texlive-base -y
sudo apt-get install texlive-science -y
sudo apt-get install texlive-latex-extra -y
sudo apt-get install latexmk -y
sudo apt-get install sl -y
sudo apt-get install zsh -y

#oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
sed 's/ZSH_THEME=\"[a-z]*\"/ZSH_THEME=\"afowler-custom\"/g' ~/.zshrc -i # set ZSH theme
cp ~/wsl-setup/auxiliary-files/afowler-custom.zsh-theme ~/.oh-my-zsh/themes/ # update with my custom theme

# copy configuration files
cp ~/wsl-setup/configs/. ~/ -r
# add aliases
echo '. ~/.zsh_aliases' >> ~/.zshrc
# VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
