" Manjaro version
set nocompatible
set t_Co=256

" Paths
let &path.="src/include,/usr/include/AL,.**"

"Search for tags file, from current directory until home directory
set tags=./tags;$HOME

"
" Plug part, add new plugins here
"
call plug#begin('~/.config/nvim/plugged')

" Using master branch
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

Plug 'qpkorr/vim-bufkill'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer --system-libclang' }

Plug 'rhysd/vim-clang-format'

Plug 'scrooloose/nerdtree'

Plug 'myusuf3/numbers.vim'

Plug 'vim-scripts/Rename2'

" Plug 'luochen1990/rainbow'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'develop' }

Plug 'vim-scripts/a.vim'

Plug 'machakann/vim-highlightedyank'

Plug 'jlanzarotta/bufexplorer'

Plug 'rust-lang/rust.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'

" Add plugins to &runtimepath
call plug#end()

"
" End of plugins
"

" Enable folding, automatically unfold for small files
set foldmethod=syntax
set foldcolumn=1

autocmd! BufReadPost * :if line('$') < 150 | set foldlevel=99 | else | set foldlevel=1 | endif

" VHDL for taglist
let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'

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
set spell spelllang=en_us

" Enable cursor line
set cursorline

" Set so the files auto updates when changed on disk
set autoread

" Redraw only when we need to
set lazyredraw

" Disable mouse in nvim
set mouse=

" Stop buffers from asking to save when switching
set hidden

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"
" Hide the buffer for the terminal
" autocmd TermOpen * set bufhidden=hide

" Keybindings
map <C-b> :BufExplorer<CR> " Explore buffers
"map <C-b> :make <CR> " Builds using make
map <C-L> :bnext<CR> " Next buffer
map <C-H> :bprev<CR> " Prev buffer

" Fix misspressing :W instead of :w
command WQ wq
command Wq wq
command W  w
command Q  q

" Map f4 to switch header/source for c projects
" map <F4> :find %:t:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
map <F4> :A<CR>

" Map autoformat after bsd rules
" autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --style=bsd

" Default for YouCompleteMe
let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"

" Airline settings
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme='luna'
let g:airline_theme='papercolor'
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

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'allow_bold': 1,
  \       'allow_italic': 1,
  \       'override' : {
  \         'color00' : ['#080808', '15'],
  \         'linenumber_bg' : ['#080808', '254'],
  \         'linenumber_fg' : ['#080808', '238'],
  \         'cursorline' : ['#080808', '255']
  \       }
  \     }
  \   },
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
set background=light
colorscheme PaperColor

" let g:solarized_termcolors=256
" set background=light
" colorscheme solarized

" colorscheme molokai
" hi Function guifg=lime gui=bold term=bold
" hi cppSTLfunction guifg=orange gui=bold term=bold

" remap the jump to tag to use YouCompletMe instead, then use jumplist CTRL+I
" and CTRL+O to jump back and forth
nnoremap <C-]> :YcmCompleter GoTo <cr>

" Settings for clang-format
let g:clang_format#command = "clang-format"
let g:clang_format#enable_fallback_style = 0
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format_on_insert_leave = 0
" let g:clang_format#style_options = {
"             \ "BasedOnStyle" : "Google",
"             \ "BreakBeforeBraces" : "Allman",
"             \ "BreakConstructorInitializersBeforeComma" : "true",
"             \ "AccessModifierOffset" : -2,
"             \ "AllowAllParametersOfDeclarationOnNextLine" : "true",
"             \ "AllowShortIfStatementsOnASingleLine" : "false",
"             \ "AllowShortFunctionsOnASingleLine" : "false",
"             \ "AllowShortLoopsOnASingleLine" : "false",
"             \ "AlwaysBreakTemplateDeclarations" : "true",
"             \ "AlignTrailingComments" : "true",
"             \ "AlignConsecutiveAssignments" : "true",
"             \ "AlignEscapedNewlinesLeft" : "true",
"             \ "AlignOperands" : "true",
"             \ "ColumnLimit" : 80,
"             \ "SortIncludes" : "false",
"             \ "SpaceBeforeAssignmentOperators" : "true",
"             \ "SpacesInAngles" : "true",
"             \ "TabWidth" : "2",
"             \ "UseTab" : "Never",
"             \ "Standard" : "C++11"}

" Highlight yank settings
let g:highlightedyank_highlight_duration = 1000
hi HighlightedyankRegion cterm=reverse gui=reverse


" map to <Leader>cf in C++ code
autocmd FileType c,h,cpp,hpp,objc nnoremap <C-f> :<C-u>ClangFormat<CR>
autocmd FileType c,h,cpp,hpp,objc vnoremap <C-f> :ClangFormat<CR>


"Auto close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"toggle on Ctrl+n
map <C-n> :NERDTreeToggle <cr>

" Rust stuff
autocmd FileType rust nnoremap <buffer> <C-f> :RustFmt<CR>
let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"
au BufNewFile,BufRead *.rs setlocal colorcolumn=100

" rainbow parenthesis
let g:rainbow_active = 1
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
let g:rainbow_conf = {
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold'],
            \}

" Save your backups to a less annoying place than the current directory.
" It saves it to ~/.config/nvim/backup or . if all else fails.
if isdirectory('~/.config/nvim/backup') == 0
  :silent !mkdir -p ~/.config/nvim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir^=~/.config/nvim/backup/
set backup
