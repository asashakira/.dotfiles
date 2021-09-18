syntax on

autocmd Filetype json
      \ let g:indentLine_setConceal=0 |
      \ let g:vim_json_syntax_conceal=0

"turn off annoying bells
set noerrorbells
set belloff=all

"local vimrc
set exrc

"diable cursor styling
set guicursor=

"turn on numbering
set number
set laststatus=2
set helpheight=999 "full screen help

"tab and indents
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set nowrap

"turn mouse on
set mouse=a

"no swapfiles or backups, only undofiles
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"search
set nohlsearch
set incsearch

"scroll option
set scrolloff=8
set sidescrolloff=16

"backspace wraps
set backspace=indent,eol,start

set formatoptions-=cro

"handle lambda correctly
set cino=j1,(0,ws,Ws
set cindent

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

Plug 'gruvbox-community/gruvbox'

call plug#end()

set background=dark

highlight Normal guibg=none

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25


"========== REMAPS =========

"leader key
let mapleader = " "

"move between splitted windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"skeletons
nnoremap <leader>cpp :-1read $HOME/.vim/templates/atcoder.cpp<CR>3}ddgg

"libaries
nnoremap <leader>uf :-1read $HOME/.vim/templates/lib/UnionFind.py<CR>
nnoremap <leader>minheap :-1read $HOME/.vim/templates/lib/MinHeap.py<CR>

"undotree
nnoremap <leader>u :UndotreeShow<CR>

"Fuzzy Finder
nnoremap <C-p> :FZF<CR>

"D but copy
nnoremap Y y$

"auto close { on enter
imap {<CR> {<CR>}<C-c>O
