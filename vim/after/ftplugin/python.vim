" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint', "pyflakes"]
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf', "black"]

" This file is an example on how to configure after-language settings

" TODO: Verify these are needed
" setlocal tabstop=4
" setlocal shiftwidth=3
" setlocal softtabstop=4
" setlocal textwidth=80
" setlocal expandtab
" setlocal autoindent
" setlocal smarttab
" setlocal formatoptions=croql

let b:shouldReindent = 0

"
" Jedi-vim
"
" All these mappings work only for python code:
" Go to definition
" let g:jedi#goto_command=',d'
" Find ocurrences
" let g:jedi#usages_command=',o'
" Find assignments
" let g:jedi#goto_assignments_command=',a'
" Go to definition in new tab
" nmap ,D :tab split<CR>:call jedi#goto()<CR>
"

call minpac#add("fisadev/vim-isort", {"type": "opt"})
let g:vim_isort_python_version = "python3"
let g:vim_isort_map = "<C-i>"

call minpac#add("davidhalter/jedi-vim")
" let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#use_splits_not_buffers = "right"
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"

call minpac#add("psf/black")
" autocmd! BufWritePre *.py execute ':Black'
