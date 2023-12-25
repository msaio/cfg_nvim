" vim-decons
set encoding=UTF-8

"Grubox theme
silent colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark='hard'
highlight Normal ctermbg=NONE guibg=NONE

"Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='powerlineish'
