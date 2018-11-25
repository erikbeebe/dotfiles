set expandtab
set shiftwidth=4
set tabstop=4
colorscheme delek

" highlight white space on line endings
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" netrw customizations
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"let g:netrw_list_hide= '.*\.swp$'

" vim filename in tmux tabs
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("/usr/bin/tmux rename-window '[vim " . expand("%:t") . "]'")
autocmd VimLeave * call system("/usr/bin/tmux setw automatic-rename")
