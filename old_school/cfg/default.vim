" Autosave: on
silent! call ToggleAutoSave()

" Foldmethod: manual
set foldmethod=manual 

" " Remember folding (means return to last position you quit)
" * fix issue with fzf
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Mouse: active
set mouse=a

" Fullscreen: off
let g:flscr = 0

" Automatically get latest change of file (:checktime for manually)
" Editing file will be sync from any source but 
" it takes maybe 2-3 seconds to take effect so dont worry
set autoread
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
			\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
			\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Show current position of cursor easily
set cursorline
set cursorcolumn
" Show current line number
" set nu rnu
set nu
" Highlight search result
set hls
" Set how many spaces 'tab' does
set tabstop=2
" Set how many space '>>' does
set shiftwidth=2
" Space instead of tab char
set expandtab
" Autoindent
set autoindent
" Set no swap file (highly recommend to run with autosave configuration)
set noswapfile
" new the right of the current buffer
set splitright
" new buffer below the current buffer
set splitbelow
" Yanked into clipboard
set clipboard^=unnamed,unnamedplus
" Highligh parenthesis
hi MatchParen ctermbg=darkblue guibg=darkblue

execute 'let g:coc_node_path = "'.$HOME.'/.asdf/shims/node"'

" "Disabled"
nnoremap <S-Down> <nop>
vnoremap <S-Down> <nop>
inoremap <S-Down> <nop>
nnoremap <S-Up> <nop>
vnoremap <S-Up> <nop>
inoremap <S-Up> <nop>
inoremap <F1> <nop>
nnoremap ZZ <nop>
nnoremap ZQ <nop>


