set expandtab
set shiftwidth=4
set tabstop=4
colorscheme delek

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" netrw customizations
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"let g:netrw_list_hide= '.*\.swp$'

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore

"if &term == "screen.xterm-256color"
"  set t_ts="\ek"
"  set t_fs="\e\\"
"  set title
"endif

"if &term == "screen"
"  set t_ts="\ek"
"  set t_fs="\e\\"
"  set title
"endif

" vim filename in tabs
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("/usr/bin/tmux rename-window '[vim " . expand("%:t") . "]'")
autocmd VimLeave * call system("tmux setw automatic-rename")

" ctags
set tags=~/.ctags_py
