set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'Vimjas/vim-python-pep8-indent'

" coc for vscode like experience
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" beautiful colorscheme
Plug 'gruvbox-community/gruvbox'

call plug#end()

" tree shitter
lua require('config')

" leader key
let mapleader = " "

" move between splitted windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" undotree
nnoremap <leader>u :UndotreeShow<CR>

" Fuzzy Finder
nnoremap <C-p> :Files<CR>

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1

" D but Y
nnoremap Y y$

" auto close { on enter
if !exists('g:vscode')
  imap {<CR> {<CR>}<C-c>O
  imap (<CR> (<CR>)<C-c>O
  imap [<CR> [<CR>]<C-c>O
endif

" no auto indent
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

