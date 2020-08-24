" note: Requires vim-plug (and vim-airline and nerdtree plugins)
set nomodeline
set expandtab
set shiftwidth=4
set tabstop=4
set number
colorscheme delek

" netrw customizations
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '.*\.swp$'

" vim filename in tabs
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("/usr/bin/tmux rename-window '[vim " . expand("%:t") . "]'")
autocmd VimLeave * call system("tmux setw automatic-rename")

" add autocmd to put highlight back when colorscheme clears it
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" ctags
set tags=~/.ctags_py

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|\t/

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let g:airline_theme='ouo'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


"map <C-p> :tabprev<CR>
"map <C-n> :tabnext<CR>
"map <C-i> :NERDTreeToggle<CR>
"let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_map = '<c-i>'
let g:ctrlp_cmd = 'CtrlP'


" buffer experiments
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
map <C-n> :bnext<CR>

" Move to the previous buffer
map <C-p> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" experiment
" NO set clipboard+=unnamedplus
"set clipboard=unnamedplus
"set go+=a               " Visual selection automatically copied to the clipboard
"set mouse+=a

" GVIM configurables
if has("gui_running")
  set guifont=Hack\ 12
  colorscheme darkblue
endif

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
