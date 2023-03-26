# generate and print key
ssh-keygen -t rsa -b 4096 -C $1
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

# configure GitHub details
git config --global user.email $2
git config --global user.name $3
git config --global core.editor vim
git config --global diff.tool vimdiff
git config --global difftool.prompt false
# git config --global merge.tool vimdiff

