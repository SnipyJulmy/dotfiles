set spell spelllang=en_gb
set nospell
set encoding=utf-8

set t_Co=256
set number
set background=dark
set termguicolors

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4

set history=1000
set undofile

" right margin at 120
set cc=120

" leader key
let mapleader=","

" tabs
set showtabline=2
map <leader>t <Esc>:tabnew<CR>

filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Visual
Plug 'kien/rainbow_parentheses.vim'
Plug 'yggdroot/indentline'

" View
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'godlygeek/tabular'

" Themes
Plug 'Badacadabra/vim-archery'
Plug 'sickill/vim-monokai'

" Comments
Plug 'scrooloose/nerdcommenter'

" Syntax
Plug 'vim-scripts/jr.vim'

call plug#end()

" usefull shortcut
map <leader>ev :tabedit /home/snipy/.vimrc<CR>
map <leader>ez :tabedit /home/snipy/.zshrc<CR>

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

colorscheme monokai

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

" JR
au BufNewFile,BufRead *.jr setf jr

""" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.dotfiles/UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/UltiSnips']

" map
nmap <leader>ue :UltiSnipsEdit<cr>

""" Tabular

nmap <leader>a/ :Tabularize /\/\/<cr>
vmap <leader>a/ :Tabularize /\/\/<cr>
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>a; :Tabularize /;<cr>
vmap <leader>a; :Tabularize /;<cr>

""" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""" Tagbar

" Scala
let g:tagbar_type_scala = {
            \ 'ctagstype' : 'scala',
            \ 'sro'       : '.',
            \ 'kinds'     : [
            \ 'p:packages',
            \ 'T:types:1',
            \ 't:traits',
            \ 'o:objects',
            \ 'O:case objects',
            \ 'c:classes',
            \ 'C:case classes',
            \ 'm:methods',
            \ 'V:values:1',
            \ 'v:variables:1'
            \ ]
            \ }

" JR
let g:tagbar_type_jr = {
            \ 'ctagstype' : 'jr',
            \ 'sro'       : '.',
            \ 'kinds'     : [
            \ 'p:packages',
            \ 'f:fields',
            \ 'g:enum types',
            \ 'e:enum constants',
            \ 'i:interfaces',
            \ 'c:classes',
            \ 'm:methods',
            \ 'P:processes',
            \ 'O:operations',
            \ 'C:capabilities',
            \ ]
            \ }
