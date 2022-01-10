# meido-vim ![](https://travis-ci.org/Hanaasagi/meido-vim.svg?branch=master) ![](https://img.shields.io/badge/release-2.4.2-F4A466.svg) ![https://github.com/Hanaasagi/meido-vim/blob/master/LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)
----

![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/logo.png)

French maid or Japanese meido?

### Screenshot

![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/start.png)

![](https://github.com/Hanaasagi/meido-vim/blob/master/.resources/screenshot.png)

### Requirements

assume you use vim8 and need to install following dependencies

```Bash
sudo apt-get install build-essential cmake libclang-dev \
                        ctags ack-grep python3-dev \
                        vim vim-runtime vim-nox
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
./meido.sh update
```

### Uninstall

```Bash
./meido.sh uninstall
```

### Plugin inside

```
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'morhetz/gruvbox'
Plugin 'Hanaasagi/suirenka'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/LeaderF'
Plugin 'thinca/vim-quickrun'
Plugin 'wakatime/vim-wakatime'
Plugin 'ActivityWatch/aw-watcher-vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Hanaasagi/remote-copy.vim'
Plugin 'Hanaasagi/inflection.vim'
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
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'mhinz/vim-startify'
```

### License
[MIT LICENSE](https://github.com/Hanaasagi/meido-vim/blob/master/LICENSE)
