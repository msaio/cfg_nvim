" Nerdtree
" https://github.com/preservim/nerdtree
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
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Nerdtree sync cursor 
"https://github.com/unkiwii/vim-nerdtree-sync
let g:nerdtree_sync_cursorline = 1

" Nerdtree git status
" https://github.com/Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

" Nerdcommenter
" https://github.com/preservim/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" FZF
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction
" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-q': function('s:build_quickfix_list'),
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


" Gitlens like
" https://github.com/APZelos/blamer.nvim
" APZelos/blamer.nvim
let g:blamer_enabled = 1 							" enable by default
let g:blamer_delay = 400 							" delay time to display
let g:blamer_show_in_visual_modes = 1 " enable in visual mode
let g:blamer_show_in_insert_modes = 0 " enable in insert mode
let g:blamer_relative_time = 1 				" commit date in relative format
let g:blamer_prefix = ' --> '           " prefix
" default color
highlight Blamer ctermfg=green 

" Close buffers
" https://github.com/Asheq/close-buffers.vim
" :Bbdelete other 🔥	     " bdelete all buffers except the buffer in the current window
" :Bdelete hidden 🔥	   " bdelete buffers not visible in a window
" :Bdelete all	         " bdelete all buffers	:bufdo bdelete
" :Bdelete this	         " bdelete buffer in the current window	:bdelete
" :Bdelete               " nameless	bdelete buffers without a name: [No Name]
" :Bdelete select	       " Lets you interactively select which buffers to bdelete
" :Bdelete menu	         " Lets you interactively choose one of the other commands above
" nnoremap <silent> <F52> :Bdelete menu<CR>

" repeat.vim
" https://github.com/tpope/vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" If you've ever tried using the "." command after a plugin map, 
" you were likely disappointed to discover 
" it only repeated the last native command inside that map, 
" rather than the map as a whole. 
" That disappointment ends today. 
" Repeat.vim remaps "." in a way that plugins can tap into it.

" surround.vim
" https://github.com/tpope/vim-surround
" It's easiest to explain with examples. Press cs"' inside
" > "Hello world!"
" to change it to
" > 'Hello world!'
"
" Now press cs'<q> to change it to
" > <q>Hello world!</q>
" To go full circle, press cst" to get
" > "Hello world!"
"
" To remove the delimiters entirely, press ds".
" > Hello world!
" Now with the cursor on "Hello", press ysiw] (iw is a text object).
" > [Hello] world!
"
" Let's make that braces and add some space 
" (use } instead of { for no space): cs]{
" > { Hello } world!
" Now wrap the entire line in parentheses with yssb or yss).
" > ({ Hello } world!)
"
" Revert to the original text: ds{ds)
" > Hello world!
" Emphasize hello: ysiw<em>
" > <em>Hello</em> world!
"
" Finally, let's try out visual mode. 
" Press a capital V (for linewise visual mode) 
" followed by S<p class="important">.
" >
" <p class="important">
  " <em>Hello</em> world!
" </p>
" This plugin is very powerful for HTML and XML editing, 
" a niche which currently seems underfilled in Vim land. 
" (As opposed to HTML/XML inserting, for which many plugins are available). 
" Adding, changing, and removing pairs of tags simultaneously is a breeze.
"
" The . command will work with ds, cs, and yss if you install repeat.vim.

" obsession.vim - Autorestore
" https://github.com/tpope/vim-obsession
" Restore previous session after shutdown (work with tmux)

" vim-bookmarks
" https://github.com/MattesGroeger/vim-bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
highlight BookmarkLine ctermbg=blue ctermfg=black
highlight BookmarkSign ctermbg=NONE ctermfg=blue

" vim-gitgutter "
" https://github.com/airblade/vim-gitgutter
let g:gitgutter_max_signs = -1
set updatetime=100
let g:gitgutter_sign_added = "+ " 
let g:gitgutter_sign_modified = "% "
let g:gitgutter_sign_removed = "- "
highlight GitGutterAdd    ctermbg=lightgreen ctermfg=blue
highlight GitGutterChange ctermbg=yellow ctermfg=white
highlight GitGutterDelete ctermbg=red ctermfg=lightgreen

" coc-snippets
" https://github.com/neoclide/coc-snippets
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
