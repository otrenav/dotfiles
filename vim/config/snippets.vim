
call minpac#add("SirVer/ultisnips")
call minpac#add("honza/vim-snippets")
call minpac#add("ycm-core/YouCompleteMe")

" TODO: Adjust keybindings
let g:UltiSnipsSnippetDirectories = ["~/.vim/own-snippets"]
let g:UltiSnipsSnippetsDir = "~/.vim/own-snippets"
let g:UltiSnipsJumpBackwardTrigger = "<leader>sb"
let g:UltiSnipsJumpForwardTrigger = "<leader>sf"
let g:UltiSnipsExpandTrigger = "<leader>ss"
let g:UltiSnipsListSnippets = "<leader>sl"
let g:ycm_use_ultisnips_completer = 1
