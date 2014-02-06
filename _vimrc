set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave xterm

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" deal with encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

" key maps
map <F2>	<ESC>:w<CR>
map <F3>	<ESC>:x<CR>
map <F4>	<ESC>:q!<CR>
map <F5>	<ESC>:e!<CR>
map <F6>	<ESC>:noh<CR>

"limpa o arquivo wget_log.txt
map <F8>	<ESC>:%s/^Estado.*: \(\w\+\).*$\n^\(.*\) URL.*\d\{4}\/\(\w\+\).*/\2  \1  \3/ge<CR>

"renomear variaveis para o Rose
map <F9>    <ESC>:%s/./\l&/ge<CR><ESC>:%s/[·‡„‚]/a/ge<CR><ESC>:%s/[ÈËÍ]/e/ge<CR><ESC>:%s/[ÌÏÓ]/i/ge<CR><ESC>:%s/[ÛÚıÙ]/o/ge<CR><ESC>:%s/[˙˘˚]/u/ge<CR><ESC>:%s/Á/c/ge<CR><ESC>:%s/r\$/real/ge<CR><ESC>:%s/%/Perc/ge<CR><ESC>:%s/\s./\U&\E/ge<CR><ESC>:%s/\s.\{,2}\s//ge<CR><ESC>:%s/\s\+//ge<CR><ESC>/\W<CR>

"coloca barra de rolagem inferior sempre
set guioptions+=b

"define o local para salvar arquivos de backup
set backupdir=~/.vim/backupfiles,~/tmp,.

"---
set nocompatible
"set backspace to be able to delete previous characters
set bs=2 
"Enable line numbering, taking up 6 spaces
set number

"Turn off word wrapping
set wrap!

"Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
"set expandtab "turn tabs into whitespace
set shiftwidth=4 "indent width for autoindent
filetype indent on "indent depends on filetype

"Shortcut to auto indent entire file
" nmap <F11> 1G=G
" imap <F11> <ESC>1G=Ga
nmap <F11> mzgg=G`z
imap <F11> <ESC>mz1G=Ga`z



"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

"Set color scheme
    "set t_Co=256
colorscheme desert  "256
syntax enable

"Enable indent folding
set foldenable
set fdm=indent

"Set space to toggle a fold
nnoremap <space> za

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"---
"Set the font and size
    "set guifont=Lucida\ Console\ 11
"Hide toolbar
    "set guioptions-=T

"Enable balloon tooltips on spelling suggestions and folds
function! FoldSpellBalloon()
let foldStart = foldclosed(v:beval_lnum )
let foldEnd = foldclosedend(v:beval_lnum)
let lines = []
" Detect if we are in a fold
if foldStart < 0
" Detect if we are on a misspelled word
let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
else
" we are in a fold
let numLines = foldEnd - foldStart + 1
" if we have too many lines in fold, show only the first 14
" and the last 14 lines
if ( numLines > 31 )
let lines = getline( foldStart, foldStart + 14 )
let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
let lines += getline( foldEnd - 14, foldEnd )
else
"less than 30 lines, lets show all of them
let lines = getline( foldStart, foldEnd )
endif
endif
" return result
return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
set balloonexpr=FoldSpellBalloon()
set ballooneval

"---
"Set line numbering to take up 5 spaces
set numberwidth=5

"Highlight current line
set cursorline

"Turn on spell checking with English dictionary
set spell
set spelllang=pt,en
set spellsuggest=9 "show only 9 suggestions for misspelled words

"Desliga o beep de erro
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"Mostra encoding e bom no status
set laststatus=2 
if has("statusline") 
	set statusline=%<%f\ %h%m%r%=%k[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %-12.(%l,%c%V%)\ %P 
endif 

