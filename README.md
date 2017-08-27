![](https://img.shields.io/badge/vim-vimrc-624498.svg)
![](https://travis-ci.org/Hanaasagi/meido-vim.svg?branch=master)
![https://github.com/Hanaasagi/meido-vim/blob/master/LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)
![](https://img.shields.io/badge/release-2.0-F4A466.svg)
----
![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/logo.png)

a graceful vimrc

```
➜  ~ time vim +q
vim +q  0.16s user 0.02s system 96% cpu 0.183 total
```
#### Requirements

```
sudo apt-get install build-essential cmake libclang-dev \
                        ctags ack-grep python-dev python3-dev
```

#### Screenshot

![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/screenshot.png)

#### Install

```
git clone https://github.com/Hanaasagi/meido-vim.git
cd meido-vim/
./install.sh
```

#### How to use

see [here](https://github.com/Hanaasagi/meido-vim/wiki/meido-vim-guide)

#### Plugin inside

```
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Hanaasagi/suirenka'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'shougo/unite.vim'
Plugin 'shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'blueyed/vim-diminactive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'sjl/gundo.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'yggdroot/indentline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rust-lang/rust.vim'
Plugin 'nvie/vim-flake8'
```

#### License
MIT
