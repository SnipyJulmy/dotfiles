set spell spelllang=en_gb
set encoding=utf-8

set t_Co=256
set number
set background=dark
set termguicolors

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

set history=1000
set undofile

filetype plugin indent on

call plug#begin()

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'Badacadabra/vim-archery'
" Plug 'zxqfl/tabnine-vim'
" Plug 'ycm-core/YouCompleteMe'

call plug#end()

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" Lightlineconfig
let g:lightline = {
      \ 'colorscheme': 'archery',
      \ }

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

colorscheme archery
