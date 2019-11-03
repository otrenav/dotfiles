
"
" Create dirs on save
"
function s:CreateMissingDirectory(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

autocmd! BufWritePre * :call s:CreateMissingDirectory(expand('<afile>'), +expand('<abuf>'))

"
" Projectionist
"
call minpac#add("tpope/vim-projectionist")

"
" Fuzzy finder
"
call minpac#add("junegunn/fzf")
call minpac#add("junegunn/fzf.vim")

nnoremap <leader>p :<C-u>FZF<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>f :Files .<CR>
nnoremap <leader>g :GFile<CR>
nnoremap <leader>r :Rg<space>

" Mapping selecting mappings
nnoremap <leader><tab> <plug>(fzf-maps-n)
xnoremap <leader><tab> <plug>(fzf-maps-x)
onoremap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

"
" Clean file
"
function! CleanFile()
    retab! 4
    call OwnPreserve("%s/\\s\\+$//e")
    if (exists('b:shouldReindent') && b:shouldReindent)
        call OwnPreserve("normal gg=G")
    endif
endfunction

" Add `let b:shouldReindent=1` to filetypes that need cleaning.
" The addition should be done in `vim/after/ftplugin/*.vim`. By
" default no re-indentation will be applied.
autocmd! BufWritePre * :call CleanFile()

"
" Rename current file
"
function! RenameFile()
    let old_name=expand('%')
    let new_name=input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

"
" netrw
"
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

noremap <silent> <leader>n :call ToggleNetrw()<CR>

"
" Welcome buffer
"
call minpac#add("mhinz/vim-startify")
