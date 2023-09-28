" ========================================
" --- "Helpers" ---
function! CurrentColorBoard()
	so $VIMRUNTIME/syntax/colortest.vim
endfunc

function! GetPath()
	let current_file = expand('%:p')	
	echo current_file | redraw
	return current_file
endfunc
noremap <F26> :call GetPath()<CR>

function! JumpToVscode()
	!code %:p
endfunc
noremap <F26><F26> :call JumpToVscode() <CR>

" ========================================
" --- "Plugins" ---
"	" Nerdtree "
" Nerdtree Toggle
map <F2> :NERDTreeToggle<CR>
" Sometimes shit happen and NERDTree command fix thing, so be it
" <Alt-F2> = <F50>
map <F50> :NERDTree<CR>
"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:nerdtree_sync_cursorline = 1
"
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" " Nerdcommenter "
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" " COC "
" You have to remap <cr> to make it confirms completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Note: \<C-g>u is used to break undo level.
" To make coc.nvim format your code on <cr>:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use coc#pum#info() if you need to confirm completion, only when there's selected complete item:
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"
" Use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
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
"
" " COC - Extension: "
" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" " FZF "
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
"
" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
"
" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
"
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"
noremap <c-\> :RG <Enter>
noremap <c-p> :Files <enter>
"
" Customize RG command to get highlight search keywords
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --colors "match:fg:black" --colors "match:bg:white" --colors "line:fg:yellow" --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
"
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" " Emoji "
" Use emoji-fzf and fzf to fuzzy-search for emoji, and insert the result
function! InsertEmoji(emoji)
    let @a = system('cut -d " " -f 1 | emoji-fzf get', a:emoji)
    normal! "agP
endfunction
"
command! -bang Emoj
  \ call fzf#run({
      \ 'source': 'emoji-fzf preview',
      \ 'options': '--preview ''emoji-fzf get --name {1}''',
      \ 'sink': function('InsertEmoji')
      \ })
" Ctrl-e in normal and insert mode will open the emoji picker.
" Unfortunately doesn't bring you back to insert mode 😕
map <C-e> :Emoj<CR>
imap <C-e> <C-o><C-e>
"
" + vim-emoji
set completefunc=emoji#complete
" set completefunc=gh_emoji#complete
" " %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
" noremap <F33><F33> :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<Enter>
function! ReplaceEmojis()
  %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
endfunction
" <F33> = <C-F9>
noremap <F33><F33> :call ReplaceEmojis()<Enter>
"
" + vim-emoji-ab
" au FileType *
		" \ runtime macros/emoji-ab.vim

" " Gitlens like "
" APZelos/blamer.nvim
let g:blamer_enabled = 1 							" enable by default
let g:blamer_delay = 400 							" delay time to display
let g:blamer_show_in_visual_modes = 1 " enable in visual mode
let g:blamer_show_in_insert_modes = 0 " enable in insert mode
let g:blamer_relative_time = 1 				" commit date in relative format
let g:blamer_prefix = ' --> '           " prefix
" default color
highlight Blamer ctermfg=green 

" " Buffers "
" Asheq/close-buffers.vim
" Open menu " <C-F10> = <F34>
nnoremap <silent> <F34> :Bdelete menu<CR>

" " tpope/vim-surround+vim-repeat "
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" " Autosave "
" tpope/vim-obsession
" <C-F3> == <F27>
" Toggle vim obsession track/pause
noremap <F27> :Obsess <CR>
" Toggle vim obsession track/delete
noremap <F27><F27> :Obsess! <CR>

" ========================================
" --- "Personal" ---
" "Save" 
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
"
" Save manually
noremap <F3> :w <Enter>
" Save all
noremap <F3><F3> :wall <Enter>
" write the current file and exit
" noremap <F3><F4> :wq <Enter>
" Like ":wq" but write only when changes have been made
noremap <F3><F4> :x <Enter>
" Quit without saving, refer to "Close buffer"
noremap <F4><F4> :q! <Enter>
" Save all openings and quit
" noremap <F4><F3> :wqall! <Enter>
" write all changed buffers and exit
noremap <F4><F3> :xa! <Enter>

" "Fold"
" " Toggle foldmethod: manual/indent (manual as default)
function! ToggleFoldMethod()
	if &foldmethod == 'manual'
		set foldmethod=indent
		echom "ToggleFoldMethod(): indent"
	else
		set foldmethod=manual
		echom "ToggleFoldMethod(): manual"
	endif
endfunc
noremap <F9><F9> :call ToggleFoldMethod() <CR>
" " Manually fold
set foldmethod=manual 
"
" " Remember folding (means return to last position you quit) * fix issue with fzf
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END


" "Mouse"
function! ToggleMouse()
	" check if mouse is enabled
	if &mouse == 'a'
		" disable mouse
		set mouse=
		echom "ToggleMouse(): OFF" 
	else
		" enable mouse everywhere
		set mouse=a
		echom "ToggleMouse(): ON"
	endif
endfunc
"
noremap <F1> :call ToggleMouse() <CR>

" "Pane"
" Toggle pane to fullscreen 
" ISSUE: may break opening nertree -> reopen nertree should be fine
let g:flscr = 0
"
function! ToggleFullScreen()
	if g:flscr == 1
		let g:flscr = 0
		exec "vertical wincmd ="
		exec "wincmd ="
		echo "ToggleFullScreen():" . g:flscr
	else
		let g:flscr = 1
		exec "vertical resize"
		exec "resize"
		echo "ToggleFullScreen():" . g:flscr
	endif
endfunc
"
noremap <C-W>= :call ToggleFullScreen() <CR>

" "Ultilities"
" Toggle PasteMode " <A-F1> == <F49>
set pastetoggle=<F49>
"
" Open note <S-F2> == <F14>
" noremap <F14> :vs $NOTE_PATH<CR>
noremap <F14> :$tabnew $NOTE_PATH<CR> 
"
" Clear hightligh keyword search
" Completely remove: <C-F5> == <F29>
noremap <F29> :let @/ = "" <Enter>
" Remove highlight only
" Use: " Ctrl-l "
"
" Search for selected
" Simple: select with <C-v> then hit //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Advance: https://vim.fandom.com/wiki/Search_for_visually_selected_text
"
" Get latest change of file 
" Manually
noremap <F5> :checktime <Enter>
" Automatically
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
"
" Apply changes : <C-F1> == <F25>
noremap <F25> :source /home/$USER/.config/nvim/init.lua <Enter>

" "Buffers"
" " Switch buffers
" Switch and also show list of buffers (previous is "#" and now is "%a")
" <F23> = <S-F11>
noremap <F23> :bprevious<CR>:redraw<CR>:ls<CR>
" <F24> = <S-F12>
noremap <F24> :bnext<CR>:redraw<CR>:ls<CR>
"
" Show listed-only buffers and allow to choose one by entering number then press <Enter> " <F47> = <C-S-F11>
noremap <F47> :buffers<CR>:buffer<Space>
" Show all buffers and allow to choose one by entering number then press <Enter> " <F48> = <C-S-F12>
noremap <F48> :buffers!<CR>:buffer<Space>
" Close buffer (current) " <F52> = <A-F4>
noremap <F52><F52> :bd<Enter>

" "Tabs"
" " Swith tabs (<C-page_up> <C-page_down> also work)
noremap <F11> :tabprev<CR>
noremap <F12> :tabnext<CR>
" " Create new tab
" <F35> = <C-F11> new tab at begining
noremap <F35> :0tabnew<CR>
" <F36> = <C-F12> new tab at last
noremap <F36> :$tabnew<CR>

" "Env"
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
" Mouse enable by default
set mouse=a


" "Disabled"
nnoremap <S-Down> <nop>
vnoremap <S-Down> <nop>
inoremap <S-Down> <nop>
nnoremap <S-Up> <nop>
vnoremap <S-Up> <nop>
inoremap <S-Up> <nop>
nnoremap ZZ <nop>
nnoremap ZQ <nop>
