set nocompatible


" ----------------------------------------------------------------
" vundle configuration starts here

filetype off			" required

" set the runtime path to include Vundle, and initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle.
Plugin 'gmarik/Vundle.vim'

" fugitive - best git interface for vim
Plugin 'tpope/vim-fugitive'

" Ctrl-P: buffer/file/mru/tag explorer with fuzzy text matching
Plugin 'kien/ctrlp.vim'

" gundo - visualise the vim undo tree
Plugin 'sjl/gundo.vim'

" flake8 - python syntax/style checker
Plugin 'nvie/vim-flake8'

" Base16 vim themes
Plugin 'chriskempson/base16-vim'

" YCM - a fast, as-you-type, fuzzy-search code completion engine
"Plugin 'Valloric/YouCompleteMe'

" Solarized colours
Plugin 'altercation/vim-colors-solarized'

" NERDTree
Plugin 'scrooloose/nerdtree'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" Syntastic
Plugin 'scrooloose/syntastic'

" CloseTag
Plugin 'vim-scripts/closetag.vim'

" Airline
Plugin 'bling/vim-airline'

" GO plugin
Plugin 'fatih/vim-go'

" Window swapping
"Plugin 'wesQ3/vim-windowswap'

" All plugins must be added before this line
call vundle#end()		" required
filetype plugin indent on	" required

" vundle configuration ends here
" ----------------------------------------------------------------

" Autoreload .vimrc on edit
autocmd! bufwritepost .vimrc source %

" flake8
" let g:flake8_builtins="_,apply"           " Add builtins
" autocmd BufWritePost *.py call Flake8()   " Run on saving a python file

syntax on
set antialias
set encoding=utf-8
colorscheme slate

if has("gui_running")
  set guioptions -=m  " hide the menu bar
  set guioptions -=T  " hide the toolbar
  set guioptions -=L
  set guioptions -=l
  set guioptions -=R
  set guioptions -=r
  colorscheme base16-monokai
  if has('unix')
    set guifont=Ubuntu\ Mono\ 13
  else
    set guifont=Ubuntu_Mono:h13
  endif
endif

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <leader>
let mapleader = ","

" Map Ctrl+<movement> key to navigate windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" nerdtree
nmap <leader>ne :NERDTree<cr>

set number		    " show line numbers
set backspace=2		" Backspace deletes in insert mode
set ruler		      " display cursor position at all times
set showcmd		    " display incomplete commands
set laststatus=2	" Always display the status line

" Softtabs, 2 spaces
set tabstop=2     " size of hard stop
set shiftwidth=2  " size of indent
set smarttab      " insert indent instead of tab at beginning of line
set shiftround
set expandtab     " use spaces instead of tab characters

" Add tabs specifically for python
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" toggle invisible characters
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:$

" Make it obvious where 80 characters is
"set textwidth=80
" set colorcolumn=+1

" Open new splits panes to right and bottom
set splitbelow
set splitright


"" syntastic conf
" syntastic should use python 3
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_python_exec = 'C:\Python34'


" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Disable arrow keys. Wow!!!
nmap <up> <Nop>
nmap <left> <Nop>
nmap <right> <Nop>
nmap <down> <Nop>

imap <up> <Nop>
imap <left> <Nop>
imap <right> <Nop>
imap <down> <Nop>

vmap <up> <Nop>
vmap <left> <Nop>
vmap <right> <Nop>
vmap <down> <Nop>


" Vala highlight: see https://wiki.gnome.org/Projects/Vala/Vim
" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120
