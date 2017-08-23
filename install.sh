#!/bin/bash

CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# symbolic link
ln -sf ${CURDIR}/vimrc $HOME/.vimrc
ln -sf ${CURDIR}/syntax $HOME/.vim/syntax
# install plugin
vim +PluginInstall +qall

cd $HOME/.vim/bundle/YouCompleteMe/

# python3 install.py --clang-completer --system-libclang   # use system clang

sed -i "s/^\" colorscheme suirenka/colorscheme suirenka/g" ${CURDIR}/vimrc

echo "Install Successed"
