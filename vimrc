" ============================================================================
" Author:      Hanaasagi
" Version:     v2.4
" Email:       ambiguous404@gmail.com
" Create Time: 2017-08-12
" Last Modify: 2020-01-25
" use za or zr to show fold code !!!

" ============================================================================


let mapleader = ','
let g:mapleader = ','

" ============================================================================
"                               Vunble Settings
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
"                               Plugin Install
" ============================================================================
" {{{
" ------------colorschemes------------
Plugin 'morhetz/gruvbox'
Plugin 'Hanaasagi/suirenka'

" ------------nerdtree------------
Plugin 'scrooloose/nerdtree'
" toggle nerdtree display
nmap <F3> :NERDTreeToggle<CR>
" don't show these file types
let NERDTreeIgnore = ['^__pycache__$', '\.pyc$', '\.pyo$']
" when open vim with no files, show nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
" autoclose nerdtree when there are no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ------------status line------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%H:%M")}'

" ------------tag bar------------
Plugin 'majutsushi/tagbar'
" a class outline viewer
nmap <F9> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" autocmd VimEnter * nested :call tagbar#autoopen(1)

" ------------YouCompleteMe------------
Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<C-p>'
let g:ycm_key_list_select_completion=['<C-j>']
let g:ycm_key_list_previous_completion=['<C-k>']
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0

let g:ycm_semantic_triggers = {
\   'python': [
\       're!from\s+\S+\s+import\s'
\   ]
\}

" ------------ LeaderF ------------
Plugin 'Yggdroot/LeaderF'
if get(g:, 'colors_name', '') == 'gruvbox'
    "let g:Lf_PopupColorscheme = 'gruvbox_material'
    let g:Lf_PopupColorscheme = 'default'
endif

nnoremap [leaderf] <Nop>
nmap <leader>f [leaderf]

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupPreviewPosition = "bottom"
let g:Lf_RgConfig = [
    \ "--no-heading",
    \ "--no-hidden",
    \ "--smart-case",
    \ "--sortr accessed",
\ ]
let g:Lf_PreviewResult = { 'rg': 1 }

nnoremap <silent> [leaderf]f :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
nnoremap <silent> [leaderf]b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
nnoremap <silent> [leaderf]r :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <silent> [leaderf]s :<C-U>Leaderf rg --current-buffer --regexMode<CR>
nnoremap <silent> [leaderf]w :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
nnoremap [leaderf]g :<C-U><C-R>=printf("Leaderf rg -e %s", "")<CR>

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
" configuration see
" https://github.com/kien/rainbow_parentheses.vim
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 15
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" auto-completion for quotes, parens, brackets
"Plugin 'Raimondi/delimitMate'
"let delimitMate_expand_cr = 1
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0

"
Plugin 'junegunn/vim-easy-align'
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

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

"
Plugin 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T', ';']
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#5FFFFF' gui=underline ctermfg=26 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#6EF6CC' gui=underline ctermfg=155 cterm=underline
augroup END

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
" Plugin 'scrooloose/syntastic'
" let g:syntastic_python_checkers=['flake8']
" nmap <silent> <F6> :SyntasticToggleMode<CR>

" Asynchronous Lint Engine
Plugin 'w0rp/ale'
let g:ale_python_flake8_options = '--ignore=E121,E123,E126,E704,W503,W504'
"let g:ale_python_pylint_options = "--disable=C0103,C0111,R0201"
" mypy.ini has higher priority
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>'
" pylint make me annoyed, I disable it
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
nmap <silent> <F6> :ALEToggle<CR>

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

Plugin 'Vimjas/vim-python-pep8-indent'

" git diff https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
nnoremap <leader>g :GitGutterSignsToggle<CR>

" the best Git wrapper
Plugin 'tpope/vim-fugitive'
" gitk for Vim
Plugin 'gregsexton/gitv'

" }}}

" ============================================================================
"                               Basic Settings
" ============================================================================
" {{{
" enable ruler
set ruler

set encoding=utf8

set laststatus=2

set nowrap

set hidden

set smartindent

set smarttab

set ignorecase
set smartcase

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

" fix delimitMate error
set backspace=2

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
"                               Display Settings
" ============================================================================
" {{{

" use relativenumber in normal mode
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" use absolutenuber in insert mode
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

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
nnoremap <F4> :call HideNumber()<CR><ESC>:IndentLinesToggle<CR>

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
if has("termguicolors")
  set termguicolors
  " see https://github.com/vim/vim/issues/993
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  try
    colorscheme gruvbox
  catch
  endtry
  let g:airline_theme='qwq'
else
  set t_Co=256
  try
    colorscheme suirenka
  catch
  endtry
  let g:airline_theme='luna'
endif

highlight LineNr ctermfg=224 ctermbg=0

hi CursorLineNR cterm=bold

" highlight custom keyword
if has("autocmd")
  " Highlight TODO, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|DONE\|BUG\|MARK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif
" }}}

" ============================================================================
"                               Window Settings
" ============================================================================
" {{{
" open new split window to the right and bottom
set splitbelow
set splitright

function! s:TabVSplit2Window() abort
    let bufnums = tabpagebuflist()
    hide tabclose
    topleft vsplit
    for n in bufnums
        execute 'sbuffer ' . n
        wincmd _
    endfor
    wincmd t
    quit
    wincmd =
endfunction
command! TabVSplit2Window call s:TabVSplit2Window()

function! s:TabSplit2Window() abort
    let bufnums = tabpagebuflist()
    hide tabclose
    topleft split
    for n in bufnums
        execute 'sbuffer ' . n
        wincmd _
    endfor
    wincmd t
    quit
    wincmd =
endfunction
command! TabSplit2Window call s:TabSplit2Window()

" }}}

" ============================================================================
"                               Syntax enhanced
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
"                               FileType Settings
" ============================================================================
" {{{

autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab colorcolumn=80 ai
autocmd FileType ruby,lua,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType go set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab textwidth=120 ai

" }}}

" ============================================================================
"                               Custom KeyMapping
" ============================================================================
" {{{

" copy selected text
vmap <C-c> "+y

" swap window position
map <Left> <C-w>H
map <Right> <C-w>L
map <Up> <C-w>K
map <Down> <C-w>J

" disable Page Up/Down
map <PageUp> <Nop>
map <PageDown> <Nop>

" disable backspace/delete
inoremap <BS> <Nop>
inoremap <Del> <Nop>

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

" quick shell
nnoremap <leader>s :shell<CR>

" quick close
nnoremap <leader>q :q<CR>

" quick save
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

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

" move window to new tab
nnoremap <leader>tm <C-W>T<CR>

" tab switch
map <leader>tf :tabfirst<CR>
map <leader>tl :tablast<CR>

map <leader>tj :tabnext<CR>
map <leader>tk :tabprev<CR>

map <leader>te :tabedit<Space>
map <leader>td :tabclose<CR>

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

" move tab to window
nnoremap <silent> <Leader>tv :TabVSplit2Window<CR>
nnoremap <silent> <Leader>ts :TabSplit2Window<CR>

noremap <Space> i<Space><Esc>
" }}}
