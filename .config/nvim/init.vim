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
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

Plug 'gruvbox-community/gruvbox'

call plug#end()

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
nnoremap <C-p> :GFiles<CR>

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

" D but copy
nnoremap Y y$

" auto close { on enter
imap {<CR> {<CR>}<C-c>O