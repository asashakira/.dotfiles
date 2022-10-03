vim.cmd [[
try
  colorscheme tokyonight-night

  fun! ColorMyPencils()
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    highlight Normal     guibg=NONE
    highlight LineNr     guibg=NONE guifg=#5eacd3
    highlight SignColumn guibg=NONE
    highlight ColorColumn ctermbg=0 guibg=#555555
    highlight CursorLineNR guibg=None
  endfun
  call ColorMyPencils()

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
