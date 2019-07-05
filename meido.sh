#!/bin/bash

SOURCEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGETDIR=$HOME
TODAY=`date +%Y%m%d`

install() {
    echo "Step 1: backup you current vim configuration"
    for i in ${TARGETDIR}/.vim ${TARGETDIR}/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$TODAY; done
    for i in ${TARGETDIR}/.vim ${TARGETDIR}/.vimrc; do [ -L $i ] && unlink $i ; done

    echo "Step 2: install vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "Step 3: initialize meido vim and install plugin"
    ln -sf ${SOURCEDIR}/vimrc ${TARGETDIR}/.vimrc
    vim +PluginInstall +qall

    echo "Step 4: install YCM"
    cd ${TARGETDIR}/.vim/bundle/YouCompleteMe/
    python3 install.py --clang-completer --system-libclang   # use system clang

    echo "Step 5: install vimproc"
    cd ${TARGETDIR}/.vim/bundle/vimproc.vim/
    make

    echo "Install Successed"
}


uninstall() {
    cd ~ && rm -rf .vim .vimrc && cd -
}


update() {
    wget https://raw.githubusercontent.com/Hanaasagi/meido-vim/master/vimrc -O vimrc
    vim +PluginUpdate +qall
}

####################
# start of script
####################

Action=$1

shift

case "$Action" in
  install   ) install   ;;
  uninstall ) unisntall ;;
  update    ) update    ;;
  *)
    echo "Usage: install | uninstall | update";;
esac

exit 0
