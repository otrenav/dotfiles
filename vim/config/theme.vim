
if (has("termguicolors"))
    set termguicolors
endif

call minpac#add("itchyny/lightline.vim")
set laststatus=2
set noshowmode

call minpac#add("patstockwell/vim-monokai-tasty")
let g:lightline = {"colorscheme": "monokai_tasty"}
colorscheme vim-monokai-tasty

autocmd! ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd! BufWinEnter * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
