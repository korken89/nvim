" Fish doesn't play all that well with others
set shell=/bin/bash
let mapleader = "\<Space>"

set nocompatible
set t_Co=256

"
" Plug part, add new plugins here
"
call plug#begin('~/.config/nvim/plugged')

" VIM enhancements
Plug 'vim-scripts/Rename2'
Plug 'qpkorr/vim-bufkill'
Plug 'rhysd/vim-clang-format'

" GUI enhancements
" Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-fugitive'
" Plug 'w0rp/ale'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Completion plugins
Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" LanguageClient enhancements
" Showing function signature and inline doc.
" Plug 'Shougo/echodoc.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Add plugins to &runtimepath
call plug#end()

"
" End of plugins
"

" let g:deoplete#enable_at_startup = 1

" Set grep tool
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" LanguageClient
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"     \ 'cpp': ['/usr/bin/cquery', '--log-file=/tmp/cq.log', '--init={"cacheDirectory":"/tmp/cquery/"}']
"     \ }

" Ignores for search
set wildignore+=*/target/*,*/build/*

" Enable folding, automatically unfold for small files
set foldmethod=syntax
set foldcolumn=1
autocmd! BufReadPost * :if line('$') < 150 | set foldlevel=99 | else | set foldlevel=1 | endif

" Sane searching
set incsearch
set ignorecase
set smartcase

set tabstop=4 shiftwidth=4 expandtab
set wrap linebreak nolist

" Do not show mode
set noshowmode

" Set scroll offset
set scrolloff=12

" Fix word wrap
set textwidth=0
set wrapmargin=0

" A column line at 100 characters, except for C
set colorcolumn=100
au Filetype c,h set colorcolumn=80

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

set shortmess+=c

" Stop buffers from asking to save when switching
set hidden


" move vertically by visual line
nnoremap j gj
nnoremap k gk

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" autocmd CompleteDone * pclose

" ALE settings
" let g:ale_sign_column_always = 1
" " only lint on save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_save = 0
" let g:ale_lint_on_enter = 0
" let g:ale_rust_cargo_use_check = 1
" let g:ale_rust_cargo_check_all_targets = 1

"
" Keybindings
"
"map <C-b> :BufExplorer<CR> " Explore buffers
"map <C-b> :make <CR> " Builds using make
map <C-L> :bnext<CR> " Next buffer
map <C-H> :bprev<CR> " Prev buffer

" Open hotkeys
map <C-p> :GFiles<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Make esc clear a search highlight and close a preview window
nnoremap <esc> :noh<return>:pclose<return><esc>

" map <C-n> :NERDTreeToggle <cr>

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" <leader>s for Rg search
noremap <leader>s :Rg<space>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)
let g:fzf_layout = { 'down': '~20%' }

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Jump to next/previous error
" nnoremap <C-j> :cnext<cr>
" nnoremap <C-k> :cprev<cr>
" nmap <silent> L <Plug>(ale_lint)
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nnoremap <C-b> :copen<cr>
" nnoremap <C-g> :cclose<cr>
nmap <silent> <C-k> <Plug>(coc-diagnostic-next-error)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Fix misspressing :W instead of :w
command WQ wq
command Wq wq
command W  w
command Q  q

" Default for YouCompleteMe
let g:ycm_confirm_extra_conf = 0

" Airline settings
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'
" let g:airline_theme='luna'
let g:airline_theme='minimalist'
" let g:airline_theme='papercolor'
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

" Python settings
autocmd FileType py nnoremap <C-f> :<C-u>Format<CR>
autocmd FileType py vnoremap <C-f> :Format<CR>

" auto open new tabs
" au BufAdd,BufNewFile * nested tab sball

" Set colorschemes
syntax enable

" let g:PaperColor_Theme_Options = {
"   \   'theme': {
"   \     'default.light': {
"   \       'allow_bold': 1,
"   \       'allow_italic': 1,
"   \       'override' : {
"   \         'color00' : ['#080808', '15'],
"   \         'linenumber_bg' : ['#080808', '254'],
"   \         'linenumber_fg' : ['#080808', '238'],
"   \         'cursorline' : ['#080808', '255']
"   \       }
"   \     }
"   \   },
"   \   'language': {
"   \     'python': {
"   \       'highlight_builtins' : 1
"   \     },
"   \     'cpp': {
"   \       'highlight_standard_library': 1
"   \     },
"   \     'c': {
"   \       'highlight_builtins' : 1
"   \     }
"   \   }
"   \ }
" set background=light
" colorscheme PaperColor

" let g:solarized_termcolors=256
" set background=light
" colorscheme solarized

colorscheme molokai
hi Function guifg=lime gui=bold term=bold
hi cppSTLfunction guifg=orange gui=bold term=bold

" Settings for clang-format
let g:clang_format#command = "clang-format"
let g:clang_format#enable_fallback_style = 0
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format_on_insert_leave = 0

" Highlight yank settings
let g:highlightedyank_highlight_duration = 1000
hi HighlightedyankRegion cterm=reverse gui=reverse

" map to <Leader>cf in C++ code
autocmd FileType c,h,cpp,hpp,objc nnoremap <C-f> :<C-u>ClangFormat<CR>
autocmd FileType c,h,cpp,hpp,objc vnoremap <C-f> :ClangFormat<CR>

"Auto close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Rust stuff
autocmd FileType rust nnoremap <buffer> <C-f> :RustFmt<CR>
let g:rustfmt_autosave = 0
let g:rustfmt_command = "rustup run stable rustfmt"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:airline#extensions#coc#enabled = 1
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" / Coc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Get fzf to follow colorscheme
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

autocmd VimEnter,ColorScheme * call s:update_fzf_colors()

" Save your backups to a less annoying place than the current directory.
" It saves it to ~/.config/nvim/backup or . if all else fails.
if isdirectory('~/.config/nvim/backup') == 0
  :silent !mkdir -p ~/.config/nvim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir^=~/.config/nvim/backup/
set backup

" Permanent undo
set undodir=~/.vimdid
set undofile
