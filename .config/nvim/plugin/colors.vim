colorscheme gruvbox
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    set background=dark

    highlight Normal     ctermbg=NONE guibg=NONE
    highlight LineNr     ctermbg=NONE guibg=NONE guifg=#5eacd3
    highlight SignColumn ctermbg=NONE guibg=NONE

    highlight ColorColumn ctermbg=0 guibg=grey
    highlight CursorLineNR guibg=None
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    highlight LineNr     ctermbg=NONE guibg=NONE

endfun
call ColorMyPencils()