#!/bin/bash

# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# symbolic link
# ln -sf ./vimrc $HOME/.vimrc
cp ./vimrc $HOME/.vimrc
# install plugin
vim +PluginInstall +qall
echo "Install Successed"
