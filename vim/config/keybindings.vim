
" Traverse buffers
nnoremap <leader>bd :bn<CR>:bd#<CR>
nnoremap <leader>w :bd<CR>
nnoremap <Right> :bn<CR>
nnoremap <Left> :bp<CR>

" Traverse windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines around
vnoremap <down> dpV`]
vnoremap <up> dkPV`]
vnoremap > >gv
vnoremap < <gv

" Edit next/previous inside parenthesis
onoremap in( :<c-u>normal! f(vi(<CR>
onoremap in) :<c-u>normal! F)vi(<CR>

" tab navigation mappings
" map tn :tabn<CR>
" map tp :tabp<CR>
" map tm :tabm
" map tt :tabnew
" map ts :tab split<CR>
" map <C-S-Right> :tabn<CR>
" imap <C-S-Right> <ESC>:tabn<CR>
" map <C-S-Left> :tabp<CR>
" imap <C-S-Left> <ESC>:tabp<CR>

" Create/delete lines in normal mode
nnoremap <CR> ko<Esc>j
nnoremap <BS> kdd

" Yank to system clipboard ("+p)
" noremap y "*y :let @+=@*<CR>

noremap <silent> <C-S> :write<CR>
noremap <C-j> ddjP
noremap <C-k> ddkP

nnoremap <leader>fn :set formatoptions+=at<CR>
nnoremap <leader>ff :set formatoptions-=at<CR>
nnoremap <leader>p :set spell! spell?<CR>
nnoremap <leader>v :edit $MYVIMRC<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <C-s> :write<CR>
nnoremap <C-S-p> "*p
nnoremap dw diw
nnoremap / /\v

" Workaround C-BS in Vim terminal
noremap! <C-BS> <Esc>diwi<space>
noremap! <C-h> <Esc>diwi<space>

" Quickly close windows
nnoremap <leader>X :q!<CR>
nnoremap <leader>x :x<CR>

" Run the q macro
nnoremap <leader>q @q

vnoremap <silent> <C-S> <C-C>:write<CR>
vnoremap > >gv
vnoremap < <gv
vnoremap / /\v

inoremap <silent> <C-S> <C-O>:write<CR>
inoremap <C-BS> echo "MESSAGE"
inoremap jf <Esc>l
inoremap fj <Esc>l

inoremap <C-s> <Esc><C-s>
