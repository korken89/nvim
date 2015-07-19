" Based of Damiano Varagnolo's .vimrc file
" Manjaro version
set nocompatible
set t_Co=256
execute pathogen#infect()
tnoremap <esc><esc> <C-\><C-n>
set incsearch
set ignorecase
set smartcase
set tabstop=2 shiftwidth=2 expandtab
set wrap linebreak nolist  " list disables line break
set textwidth=0
set wrapmargin=0
set colorcolumn=80
set spell spelllang=en_us
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove tool bar
set guifont=DejaVuSansMono\ 14
set number
set langmenu=en_US
let $LANG = 'en_US'
setlocal spell spelllang=en_us
set cursorline
set mouse=

" Navigate spits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Navigate buffer
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Default for YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

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
