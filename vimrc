" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Change mapleader
" \ is the leader default character
let mapleader=","

" key maps
map <F2>	<ESC>:w<CR>
map <F3>	<ESC>:x<CR>
map <F4>	<ESC>:q!<CR>
map <F5>	<ESC>:e!<CR>
map <F6>	<ESC>:noh<CR>


" crazy mapping for terminals
"set timeout timeoutlen=1000 ttimeoutlen=100
"if !has("gui_running")
"  if &term == "xterm"
"    set <F13>=C
"    map <F13> <C-S-C>
"    map! <F13> <C-S-C>    
"  endif
"endif

" copy with OS suport =)
map <leader>y "+y
map <C-S-C>   "+y
map \c        "+y

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
"colorscheme desert
let g:solarized_termtrans=1

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
if !has("unix")
  set clipboard=unnamed        " Windows
else  
  set clipboard=unnamedplus    " Linux
endif

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

"set backspace to be able to delete previous characters
set bs=2

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable line numbers
set number

"Set line numbering to take up 5 spaces
set numberwidth=5

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Highlight searches
set hlsearch

"Informative status line
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Disable error bells
set noerrorbells

" Show the cursor position
set ruler

"coloca barra de rolagem inferior sempre
set guioptions+=b

" Switch wrap off for everything
set nowrap

" Always display the status line
set laststatus=2

" Show the current mode
set showmode

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Softtabs, 2 spaces
set tabstop=2 "set tab character to 2 characters
set shiftwidth=2 "indent width for autoindent
set expandtab "turn tabs into whitespace

"Turn on smart indent
set smartindent
filetype indent on "indent depends on filetype

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif