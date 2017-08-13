#!/bin/bash

CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# symbolic link
ln -sf ${CURDIR}/vimrc $HOME/.vimrc
# install plugin
vim +PluginInstall +qall
echo "Install Successed"
