# installations
sudo apt clean
sudo apt update
sudo apt upgrade -y
sudo apt-get install tree -y
sudo apt-get install python3.7 -y
sudo apt-get install python3-pip -y
sudo apt-get install python3-venv -y
sudo apt-get install texlive-base -y
sudo apt-get install texlive-science -y
sudo apt-get install texlive-latex-extra -y
sudo apt-get install latexmk -y
sudo apt-get install zsh -y

#oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
sed 's/ZSH_THEME=\"[a-z]*\"/ZSH_THEME=\"gentoo\"/g' ~/.zshrc -i # set ZSH theme

# set up aliases
cp ~/wsl-setup/auxiliary-files/.zsh_aliases ~/
echo '. ~/.zsh_aliases' >> ~/.zshrc

# VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/wsl-setup/auxiliary-files/.vimrc ~/

cp ~/wsl-setup/auxiliary-files/UltiSnips ~/.vim/ -r
cp ~/wsl-setup/auxiliary-files/ftplugin ~/.vim/ -r

touch ~/.toggl_token
touch ~/.toggl_wid
echo "REMEMBER TO UPDATE ~/.toggl_token"
