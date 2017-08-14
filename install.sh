#!/bin/bash

CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# symbolic link
ln -sf ${CURDIR}/vimrc $HOME/.vimrc
# install plugin
vim +PluginInstall +qall

cd $HOME/.vim/bundle/YouCompleteMe/

if [ `which clang` ]   # check system clang
then
    python install.py --clang-completer --system-libclang   # use system clang
else
    python install.py --clang-completer
fi

sed -i "s/\" colorscheme suirenka/colorscheme suirenka/g" ${CURDIR}/vimrc

echo "Install Successed"
