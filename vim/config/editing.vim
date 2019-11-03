
" Replace from position and forward
call minpac#add("wincent/scalpel")

" Surrounding motions and actions
call minpac#add("tpope/vim-surround")

" Easier word replacements
call minpac#add("tpope/vim-abolish")

" Comments
call minpac#add("tpope/vim-commentary")

" Asynchronous Lint Engine (ALE)
call minpac#add("dense-analysis/ale")
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_keep_list_window_open = 1
" let g:ale_list_vertical = 1
" let g:ale_open_list = 1
let g:ale_completion_tsserver_autoimport = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

"
" Links
"
call minpac#add("mattn/webapi-vim")
call minpac#add("christoomey/vim-quicklink")

"
" Custom text objects
"
" let g:vim_textobj_parameter_mapping = ','
call minpac#add("wellle/targets.vim")
call minpac#add("kana/vim-textobj-user")
call minpac#add("kana/vim-textobj-indent")
call minpac#add("sgur/vim-textobj-parameter")
call minpac#add("michaeljsmith/vim-indent-object")

"
" Searching
"
call minpac#add("osyo-manga/vim-anzu")
call minpac#add("haya14busa/is.vim")

"
" Navigation with chars
"
call minpac#add("justinmk/vim-sneak")
" s<char1><char>    go to combination (forward)
" S<char1><char>    go to combination (back)
" ;                 go to next
" ``                go back to start
" s<Enter>          repeat last search

"
" Expand selection region
"
call minpac#add("terryma/vim-expand-region")
" +     expand region
" -     shrink region

"
" Indentation
"
call minpac#add('jeetsukumaran/vim-indentwise')
" [- : Move to previous line of lesser indent than the current line.
" [+ : Move to previous line of greater indent than the current line.
" [= : Move to previous line of same indent as the current line that is separated from the current line by lines of different indents.
" ]- : Move to next line of lesser indent than the current line.
" ]+ : Move to next line of greater indent than the current line.
" ]= : Move to next line of same indent as the current line that is separated from the current line by lines of different indents.

"
" EditorConfig
"
call minpac#add("editorconfig/editorconfig-vim")

"
" ctags
"
command! MakeTags !ctags -R .
