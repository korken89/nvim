" Manjaro version
set nocompatible
set t_Co=256

" Paths
let &path.="src/include,/usr/include/AL,.**"

"Search for tags file, from current directory until home directory
set tags=./tags;$HOME

execute pathogen#infect()

" Set exiting term mode to esc esc
tnoremap <esc><esc> <C-\><C-n>

" Make esc clear a search highlight
nnoremap <esc> :noh<return><esc>

set incsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=4 expandtab
set wrap linebreak nolist  " list disables line break

" Set scroll offset
set scrolloff=12

" Fix word wrap
set textwidth=0
set wrapmargin=0

" A column line at 80 characters
set colorcolumn=80

" Spell checking stuff
set langmenu=en_US
let $LANG = 'en_US'
setlocal spell spelllang=en_us

" Enable cursor line and line numbers
set cursorline
set number

" Disable mouse in nvim
set mouse=

" Stop buffers from asking to save when switching
set hidden

" set so the files auto updates when changed on disk
set autoread

" Hide the buffer for the terminal
" autocmd TermOpen * set bufhidden=hide

" Keybindings
map <C-b> :make <CR> " Builds using make
map <C-K> :bnext<CR> " Next buffer
map <C-J> :bprev<CR> " Prev buffer

" Map f4 to switch header/source for c projects
map <F4> :find %:t:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" Map autoformat after bsd rules
" autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --style=bsd

" Default for YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.nvim/.ycm_extra_conf.py"

" Airline settings
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#checks = [ 'indent' ]

" Settings for syntax highlight
let g:cpp_class_scope_highlight = 1

" remove trailing white spaces when saving
autocmd BufWritePre * :%s/\s\+$//e

" OCaml settings
filetype indent on
filetype plugin on
au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" auto open new tabs
" au BufAdd,BufNewFile * nested tab sball

" Set colorschemes
syntax enable
"colorscheme lizard
colorscheme molokai
hi Function guifg=lime gui=bold term=bold
hi cppSTLfunction guifg=orange gui=bold term=bold

" Save your backups to a less annoying place than the current directory.
" It saves it to ~/.nvim/backup or . if all else fails.
if isdirectory('~/.nvim/backup') == 0
  :silent !mkdir -p ~/.nvim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir^=~/.nvim/backup/
set backup
