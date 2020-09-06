
let mapleader="\\"
filetype plugin indent on
syntax on

" Search into subfolders
set path+=**

set title
set nowrap
set backup
set showcmd
set hlsearch
set wildmenu
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
set noswapfile
set splitbelow
set scrollbind
set nocompatible
set autowriteall
set number relativenumber
set noerrorbells novisualbell
set spellfile=$HOME/.vim/en_us.utf-8.add
set backupdir=$HOME/.vim/dirs/backups
set directory=$HOME/.vim/dirs/tmp
set backspace=indent,start,eol
set diffopt=filler,horizontal
set undodir=$HOME/.vim/undo
set list listchars=tab:»·
set formatoptions+=tcqnj
set formatoptions-=o
set formatoptions-=r
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
set shortmess-=S
set tabstop=4
set mouse=a

packadd! matchit
