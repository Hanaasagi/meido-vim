" ============================================================================
" Author:      Hanaasagi
" Version:     v0.1a
" Email:       ambiguous404@gmail.com
" Create Time: 2017-08-12
" Last Modify: 2017-08-12

" ============================================================================


" ============================================================================
"				Vunble Settings
" ============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" let Vundle manage Plugins
Plugin 'gmarik/vundle'

" ============================================================================
"   				Plugin Install
" ============================================================================

" ------------colorschemes------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Hanaasagi/suirenka'

" --------rainbow parentheses--------
Plugin 'kien/rainbow_parentheses.vim'

" ------------nerdtree------------
Plugin 'scrooloose/nerdtree'
" toggle nerdtree display                                                       
nmap <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['__pycahce__', '\.pyc$', '\.pyo$']

" ------------status line------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ------------tag bar------------
Plugin 'majutsushi/tagbar'
" a class outline viewer
nmap <F8> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
autocmd VimEnter * nested :call tagbar#autoopen(1)


" ===========================================================================
" 				Basic Settings
" ===========================================================================

let mapleader = ','
let g:mapleader = ','

" no backuup
set nobackup

" no swap
set noswapfile

" disable mouse
set mouse-=a

" disable arrow key
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" ============================================================================
"   				Display Settings
" ============================================================================

" show line number
set number
" close number
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F4> :call HideNumber()<CR>

" highlight syntax
syntax on

" not show the message
set shortmess=atI

" highlight current line and column
set cursorcolumn
set cursorline

" highlight search text
set hlsearch
set incsearch

" colorscheme
set background=dark
set t_Co=256
colorscheme suirenka 

" highlight custom keyword
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" ============================================================================
"   				Window Settings
" ============================================================================

" open new split window to the right and bottom
set splitbelow
set splitright


" ============================================================================
"   				Custom KeyMapping
" ============================================================================

" convenient way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
