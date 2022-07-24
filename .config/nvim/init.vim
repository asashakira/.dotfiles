set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mattn/emmet-vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" coc for vscode like experience
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'

" nerds
Plug 'preservim/nerdcommenter'

" harpoooooooooooooooon
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

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

" C-^ not working on mac...
nnoremap <leader>b <C-^>

" undotree
nnoremap <silent><leader>u :UndotreeShow<CR>

" Telescope
nnoremap <silent><C-p> <cmd>Telescope find_files<CR>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>

" prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" netrw
filetype plugin on
nnoremap <leader>pv :Ex<CR>

" the y
nnoremap Y y$
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" no auto indent
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" langu
lang en_US.UTF-8

