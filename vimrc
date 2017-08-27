" ============================================================================
" Author:      Hanaasagi
" Version:     v0.1a
" Email:       ambiguous404@gmail.com
" Create Time: 2017-08-12
" Last Modify: 2017-08-22
" use za or zR to show fold code !!!

" ============================================================================


let mapleader = ','
let g:mapleader = ','

" ============================================================================
"				                Vunble Settings
" ============================================================================
" {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" let Vundle manage Plugins
Plugin 'gmarik/vundle'
" }}}

" ============================================================================
"   				            Plugin Install
" ============================================================================
" {{{
" ------------colorschemes------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Hanaasagi/suirenka'

" ------------nerdtree------------
Plugin 'scrooloose/nerdtree'
" toggle nerdtree display
nmap <F3> :NERDTreeToggle<CR>
" don't show these file types
let NERDTreeIgnore = ['__pycahce__', '\.pyc$', '\.pyo$']
" when open vim with no files, show nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
" autoclose nerdtree when there are no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ------------status line------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1

" ------------tag bar------------
Plugin 'majutsushi/tagbar'
" a class outline viewer
nmap <F9> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" autocmd VimEnter * nested :call tagbar#autoopen(1)

" ------------YouCompleteMe------------
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion=['<C-j>']
let g:ycm_key_list_previous_completion=['<C-k>']
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0

" ------------Unite.vim------------
Plugin 'shougo/unite.vim'
Plugin 'shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'

let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts='-s -H --no-heading --no-color --column'
let g:unite_source_grep_recursive_opt=''

nnoremap [unite] <Nop>
nmap ; [unite]

nnoremap <silent> [unite]c :<C-u>Unite -toggle -auto-resize -buffer-name=file file<CR><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=file_rec file_rec/async:!<CR><c-u>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=recent file_mru<CR>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/unite<CR>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<CR>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<CR>

try
    call unite#custom#profile('default', 'context', {
    \   'start_insert': 1,
    \   'prompt': '>>',
    \   'ignore_case': 1,
    \   'smart_case': 1,
    \   'winheight': 20,
    \   'direction': 'botright',
    \ })
catch
endtry

function! s:unite_my_settings()
    " Overwrite settings.

    imap <buffer> kjj  <plug>(unite_exit)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
endfunction

autocmd FileType unite call s:unite_my_settings()

" ------------quick run------------
Plugin 'thinca/vim-quickrun'

let g:quickrun_config = {
\   "_" : {
\       "outputter" : "quickfix",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader><F5> <Plug>(quickrun)


" ------------others----------
" rainbow parentheses
Plugin 'kien/rainbow_parentheses.vim'
" auto-completion for quotes, parens, brackets
Plugin 'Raimondi/delimitMate'

" quick comment
Plugin 'scrooloose/nerdcommenter'

" Plugin 'grep.vim'
" Plugin 'mileszs/ack.vim'
" nnoremap <Leader>a :Ack<Space>

" Vim plugin to dim inactive windows
Plugin 'blueyed/vim-diminactive'

" easily delete, change and add such surroundings in pairs
Plugin 'tpope/vim-surround'

" enhance repeat
Plugin 'tpope/vim-repeat'

" visualize your Vim undo tree
Plugin 'sjl/gundo.vim'
nnoremap <F8> :GundoToggle<CR>

" set hidden
" Plugin 'vim-ctrlspace/vim-ctrlspace'

" enhance css color
Plugin 'lilydjwg/colorizer'

" marks
Plugin 'kshenoy/vim-signature'

" like sublime multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" quick fix trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<CR>

" syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" displaying thin vertical lines at each indentation level
Plugin 'yggdroot/indentline'
let g:indentLine_enabled=0
autocmd FileType python let g:indentLine_enabled=1 |
                        let g:indentLine_char='¦' |
                        let g:indentLine_color_term=173
" let g:indentLine_bgcolor_term = 101

" ------------language plugins------------

" Plugin 'leafgarland/typescript-vim'

Plugin 'vim-ruby/vim-ruby'

Plugin 'rust-lang/rust.vim'

" flake8
Plugin 'nvie/vim-flake8'

" }}}

" ============================================================================
" 				                Basic Settings
" ============================================================================
" {{{
" enable ruler
set ruler

set encoding=utf8

set laststatus=2

set nowrap

set hidden

" auto set nopaste when leave insert mode
au InsertLeave * set nopaste

" no backuup
set nobackup

" no swap
set noswapfile

" disable mouse
set mouse-=a

" keep 3 lines when cursor move to top or bottom
set scrolloff=3

" space instead of tab
set expandtab

" 4 width tab
set tabstop=4

" shift width
set shiftwidth=4

" backspace delete 4 spaces
set softtabstop=4

" upcase word in insert mode
" inoremap <C-l> <ESC>gUiwea
" reverse word case
inoremap <C-l> <ESC>g~iwea

" fold code
set foldenable
set foldmethod=indent
set foldlevel=99

set wildmenu
set wildmode=longest,list,full

" regex search very magic mode
nmap <buffer> / /\v
vmap <buffer> / /\v

" use relativenumber in normal mode
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" use absolutenuber in insert mode
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" auto goto last modify location
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

" fold vimrc
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker | :normal zM
augroup END

" }}}

" ============================================================================
"   				            Display Settings
" ============================================================================
" {{{
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
try
colorscheme suirenka
" colorscheme molokai
catch
endtry

highlight LineNr ctermfg=224 ctermbg=0

hi CursorLineNR cterm=bold

" highlight custom keyword
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif
" }}}

" ============================================================================
"   				            Window Settings
" ============================================================================
" {{{
" open new split window to the right and bottom
set splitbelow
set splitright
" }}}

" ============================================================================
"   				            Syntax enhanced
" ============================================================================
" {{{
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end
" }}}

" ============================================================================
"   				            FileType Settings
" ============================================================================
" {{{

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab colorcolumn=80 ai
autocmd FileType ruby,lua,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" }}}

" ============================================================================
"   				            Custom KeyMapping
" ============================================================================
" {{{

" change window position
map <Left> <C-w>H
map <Right> <C-w>L
map <Up> <C-w>K
map <Down> <C-w>J

" disable Page Up/Down
map <PageUp> <Nop>
map <PageDown> <Nop>

" cancel highlight
noremap <silent><leader>/ :nohls<CR>
" convenient way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Allow saving of files as sudo when I forgot to start vim using sudo.
" Thanks for http://feihu.me/blog/2014/vim-write-read-only-file/
cmap w!! w !sudo tee > /dev/null %

" quick close
nnoremap <leader>q :q<CR>

" quick save
nnoremap <leader>w :w<CR>

" quick close quickfix
nnoremap <leader>e :ccl<CR>

cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap - :m .+1<CR>==
nnoremap _ :m .-2<CR>==

" new tab
nnoremap <leader>tn  :tabnew<CR>

" tab switch
map <leader>tf :tabfirst<CR>
map <leader>tl :tablast<CR>

map <leader>tj :tabnext<CR>
map <leader>tk :tabprev<CR>

map <leader>te :tabedit<Space>
map <leader>td :tabclose<CR>
map <leader>tm :tabm<CR>

" jump to specific tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>


" close buffer really need?
noremap <leader>bd :bd<CR>
" }}}
