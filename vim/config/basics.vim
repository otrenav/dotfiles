
let mapleader=" "
set title
set backup
set showcmd
set hlsearch
set undofile
set autoread
set smartcase
set expandtab
set incsearch
set ignorecase
set shiftround
set autoindent
set cursorline
set splitright
set splitbelow
set nocompatible
set autowriteall
set number relativenumber
set noerrorbells novisualbell
set spellfile=$HOME/.vim/en_us.utf-8.add
set backupdir=$HOME/.vim/dirs/backups
set omnifunc=syntaxcomplete#Complete
set directory=$HOME/.vim/dirs/tmp
set backspace=indent,start,eol
set wildmode=list:longest,full
set undodir=$HOME/.vim/undo
set list listchars=tab:»·
set formatoptions+=cqn
set diffopt+=vertical
set undoreload=10000
set undolevels=1000
set spelllang=en_us
set encoding=utf-8
set colorcolumn=81
set softtabstop=4
set scrolloff=10
set wrapmargin=0
set shiftwidth=4
set shortmess+=I
set nrformats=
" TODO: columns + wrapping?
" set columns=80
set tabstop=4

runtime macros/matchit.vim

autocmd! BufWritePost vimrc source $MYVIMRC
