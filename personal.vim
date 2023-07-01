" =======================================================================================================================================
" ---Plugins Config---
"	+ Nerdtree
" Nerdtree Toggle
map <F2> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:nerdtree_sync_cursorline = 1

" + Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" + coc
" You have to remap <cr> to make it confirms completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Note: \<C-g>u is used to break undo level.
" To make coc.nvim format your code on <cr>:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use coc#pum#info() if you need to confirm completion, only when there's selected complete item:
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" Note: the <tab> could be remapped by another plugin, use :verbose imap <tab> to check if it's mapped as expected.
" use <c-space>for trigger completion
inoremap <silent><expr> <s-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" coc - Extension:
" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" + FZF
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

noremap <c-\> :RG <Enter>
noremap <c-p> :Files <Enter>

" Customize RG command to get highlight search keywords
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --colors "match:fg:black" --colors "match:bg:white" --colors "line:fg:yellow" --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" + vim-emoji
set completefunc=gh_emoji#complete

" + vim-emoji-ab
au FileType html,php,markdown,mmd,text,mail,gitcommit,vim
    \ runtime macros/emoji-ab.vim

" gitlens like - blamer
let g:blamer_enabled = 1 							" enable by default
let g:blamer_delay = 400 							" delay time to display
let g:blamer_show_in_visual_modes = 1 " enable in visual mode
let g:blamer_show_in_insert_modes = 0 " enable in insert mode
let g:blamer_relative_time = 1 				" commit date in relative format
let g:blamer_prefix = ' --> '           " prefix
" default color
highlight Blamer ctermfg=green 

" =======================================================================================================================================
" ---Personal Config---
" Show current position of cursor easily
set cursorline
set cursorcolumn

" Show current line number
set nu rnu

" Highlight search result
set hls

" Set how many spaces 'tab' does
set tabstop=2
" Set how many space '>>' does
set shiftwidth=2

" Autoindent
set autoindent

" Set no swap file (highly recommend to run with autosave configuration)
set noswapfile

" Below shortcut combine keys help disbaling
function! ToggleAutoSave()
	if !exists('#Autosave#TextChanged') 
		augroup Autosave
			autocmd!
			" " Autosave when text changed
			autocmd TextChanged,TextChangedI <buffer> silent write
			" " Autosave when exiting insert mode and move to other panes
			au InsertLeave,BufLeave * silent! wall
		augroup END
		echo "autosave ON"
	else
		augroup Autosave
			autocmd!
		augroup END
		echo "autosave OFF"
	endif
endfunc
" Autosave is enabled by default
silent! call ToggleAutoSave()<CR>
" <S-F3> == <F15>
noremap <F15> :call ToggleAutoSave() <CR>

" " Remember folding (means return to last position you quit) * fix issue with fzf
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Toggle PasteMode : <C-F2> == <F26>
set pastetoggle=<F26>

" Mouse in vim
function! ToggleMouse()
	" check if mouse is enabled
	if &mouse == 'a'
		" disable mouse
		set mouse=
		echom "mouse OFF" 
	else
		" enable mouse everywhere
		set mouse=a
		echom "mouse ON"
	endif
endfunc

" Toogle current window to max hori and verti
let g:flscr = 0
function! ToggleFullScreen()
	if g:flscr == 1
		let g:flscr = 0
		exec "vertical wincmd ="
		exec "wincmd ="
	else
		let g:flscr = 1
		exec "vertical resize"
		exec "resize"
	endif
endfunc
noremap <C-W>= :call ToggleFullScreen() <CR>

" <F1>
noremap <F1> :call ToggleMouse() <CR>

" <C-F2> == <F26>
" noremap <F26> :call ToggleMouse() <CR>

" Save manually
noremap <F3> :w <Enter>
" Save all
noremap <F3><F3> :wall <Enter>
" <C-F3> == <F27>
" Toggle vim obsession track/pause
noremap <F27> :Obsess <CR>
" Toggle vim obsession track/delete
noremap <F27><F27> :Obsess! <CR>

" Save and quit
noremap <F3><F4> :wq <Enter>
" Quit without saving " <F28> = <C-F4>
noremap <F4><F4> :q! <Enter>
noremap <F28><F28> :bdelete <Enter>

" Save all openings and quit
noremap <F4><F3> :wqall! <Enter>

" Clear the highlight search : <C-F5> == <F29> with plug we current have, can
" use ctrl-l instead
noremap <F29> :let @/ = "" <Enter>
" Get latest change manually
noremap <F5> :checktime <Enter>

" Get latest change automatically
" Editing file will be sync from any source but it takes maybe 2-3 seconds to take effect so dont worry
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

" Apply changes : <C-F1> == <F25>
noremap <F25> :source /home/$USER/.config/nvim/init.vim <Enter>

" Buffers aka Tabs
" " Simply switch buffers
" noremap <F6> :bprevious <Enter>
" noremap <F7> :bnext <Enter>
" Switch and also show list of buffers (previous is "#" and now is "%a")
noremap <F7> :bnext<CR>:redraw<CR>:ls<CR>
noremap <F6> :bprevious<CR>:redraw<CR>:ls<CR>
" Show listed-only buffers and allow to choose one by entering number then press <Enter> " <F30> = <C-F6>
noremap <F30> :buffers<CR>:buffer<Space>
" Show all buffers and allow to choose one by entering number then press <Enter> " <F31> = <C-F7>
noremap <F31> :buffers!<CR>:buffer<Space>
" Close current buffer <F8>
noremap <F8><F8> :bd<Enter>

noremap <F12> :bnext<CR>:redraw<CR>:ls<CR>
noremap <F10> :bprevious<CR>:redraw<CR>:ls<CR>
" new the right of the current buffer
set splitright
" new buffer below the current buffer
set splitbelow



set clipboard^=unnamed,unnamedplus
