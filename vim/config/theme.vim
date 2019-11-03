
highlight ExtraWhitespace ctermbg=red guibg=red
highlight CursorLine ctermbg=236 cterm=bold
highlight PmenuSel ctermbg=240 ctermfg=255
highlight Pmenu ctermbg=245 ctermfg=255
highlight CursorLineNr ctermfg=242
highlight ColorColumn ctermbg=236
highlight LineNr ctermfg=242
filetype plugin indent on
syntax on

autocmd! ColorScheme * highlight ExtraWhitespace ctermbg=red
autocmd! BufWinEnter * match ExtraWhitespace /\s\+$/

" Smart status line
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline_theme='deus'
