# meido-vim ![](https://travis-ci.org/Hanaasagi/meido-vim.svg?branch=master) ![](https://img.shields.io/badge/release-2.1-F4A466.svg) ![https://github.com/Hanaasagi/meido-vim/blob/master/LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)
----

![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/logo.png)

French maid or Japanese meido? 

```
➜  ~ time vim +q
vim +q  0.16s user 0.02s system 96% cpu 0.183 total
```
**note: meido vim only tested in Arch Linux and Vim8 environment**

### Screenshot

![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/screenshot.png)

### Requirements

assume you use vim8 and need to install following dependencies

```Bash
sudo apt-get install build-essential cmake libclang-dev \
                        ctags ack-grep python-dev python3-dev
```

### Minimal Install

```Bash
git clone https://github.com/Hanaasagi/meido-vim.git
cd meido-vim/
./meido.sh install
```

*meido-vim use [YCM](https://github.com/Valloric/YouCompleteMe) for code-completion. Only completing C And Python code by default. If you want more, please read this [section](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64) and install manually*

### How to use

see [here](https://github.com/Hanaasagi/meido-vim/wiki/meido-vim-guide)


### Update

```Bash
./medio.sh update
```

### Uninstall

```Bash
./meido.sh uninstall
```

### Plugin inside

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
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'
Plugin 'blueyed/vim-diminactive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'unblevable/quick-scope'
Plugin 'sjl/gundo.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'w0rp/ale'
Plugin 'yggdroot/indentline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rust-lang/rust.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
```

### License
[MIT](https://github.com/Hanaasagi/meido-vim/blob/master/LICENSE)
