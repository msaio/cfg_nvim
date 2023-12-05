" C == Ctrl
" A == Alt
" \ == Leader

" "F1"
" <F1>			: toggle mouse
" <C-F1>		: reload all configs <F25>
" <A-F1>		: toggle pastemode <F49>
" <S-F1>		: switch foldmode manual/indent <F13>
noremap <F1> :call ToggleMouse() <CR>
noremap <F25> :source $NVIM_CFG_PATH/init.lua <Enter>
set pastetoggle=<F49>
noremap <F13> :call ToggleFoldMethod() <CR>

" "F2"
" <F2>		: toggle Nerdtree
" <C-F2>	: reset Nerdtree <F26>
" <A-F2>	: open current buffer/file to VSCode <F50>
" <S-F2>  : <F14> ?
map <F2> :NERDTreeToggle<CR>
map <F26> :NERDTree<CR>
noremap <F50> :call JumpToVscode() <CR>

" "F3"
" <F3><F3>		: save all manually 
" <C-F3>			: <F27> ?
" <A-F3>			: <F51> ?
" <S-F3>			: toggle vim obsession track/pause <F15>
" <S-F3> x2		: toggle vim obsession track/delete <F15><F15>
noremap <F3><F3> :wall <Enter>
noremap <F15> :Obsess <CR>
noremap <F15><F15> :Obsess! <CR>

" "F3-F4"
" <F3><F4>		: like ":wq" but write only when changes have been made
noremap <F3><F4> :x <Enter>

" "F4"
" <F4><F4>  		: quit without saving
" <C-F4><C-F4>	: close current buffer <F28><F28>
" <A-F4>				: open Bdelete menu <F52>
" <S-F4>				: <F16> ?
noremap <F4><F4> :q! <Enter>
noremap <F28><F28> :bd<Enter>
nnoremap <silent> <F52> :Bdelete menu<CR>

" "F4-F3"
"<F4><F3>   : write all changed buffers and exit
noremap <F4><F3> :xa! <Enter>

" "F5" 
" <F5>					: ?
" <F5><F5>			: refresh current buffer ( 
"                 cfg, file changes, 
"                 remove highlight search results
"               )
"               <C-l> : turn off highlight search keywords
" <C-F5>				: <F29> ?
" <A-F5>				: <F53> ?
" <S-F5> 		 		: <F17> ?
noremap <F5><F5> :call RefreshCurrentBuffer() <CR>

	
" "Wincmd : <C-w>"
" C-w + =			: toggle fullscreen for current pane
noremap <C-W>= :call ToggleFullScreen() <CR>

" "/"
" // : search current selected (visualmode)
" vnoremap // :call SearchSelected()<CR>
vnoremap // :call LuaSearchSelected()<CR>

" "Leader : \"

" "buffers
" \bh		: move to previous buffer
" \bl		: move to next buffer
" \bb		: show listed-only buffers and allow to choose
" \z    : highlight previous search
" \Z    : highlight next search
" \/    : replace current searched with ...
noremap <leader>bh :bprevious<CR>:redraw<CR>:ls<CR> 
noremap <leader>bl :bnext<CR>:redraw<CR>:ls<CR> 
noremap <leader>bb :buffers<CR>:buffer<Space> 
noremap <leader>bb :buffers<CR>:buffer<Space> 
nnoremap <leader>z :call LuaPreviousSearch()<CR>
nnoremap <leader>Z :call LuaNextSearch()<CR>
map <leader>/ :call LuaReplaceSelected() <CR>

" "tabs
" \th		: jump to previous tab (gT)
" \tl 	: jump to next tab (gt)
" \tnh	: create new empty tab at the left
" \tnl	: create new empty tab at the right
noremap <leader>th :tabprev<CR> 
noremap <leader>tl :tabnext<CR> 
noremap <leader>tnh :0tabnew<CR> 
noremap <leader>tnl :$tabnew<CR> 



" "tpope/vim-repeat"
" . (dot/period/fullstop):  works like @record

" "tpope/vim-surround"
" cs"'    : replace inside " with '
" cs'<q>  : replace inside ' with <q>
" cst"    : go full circle "
" ds"     : remove delimiters entirely "
" ysiw" 	: put word at cursir in "
" cs]{ 		: replace ] with { + space 
" cs]} 		: replace ] with { + no space
" yss" 		: put current line into "
" The . command will work with ds, cs, and yss if you install repeat.vim.

" "MattesGroeger/vim-bookmarks"
" mm					: add/remove bookmark at current line  				  :BookmarkToggle
" mi	    		: add/edit/remove annotation at current line    :BookmarkAnnotate <TEXT>
" mn	    		: jump to next bookmark in buffer 							:BookmarkNext
" mp  				: jump to previous bookmark in buffer						:BookmarkPrev
" ma					: show all bookmarks (toggle)										:BookmarkShowAll
" mc 					: clear bookmarks in current buffer only				:BookmarkClear
" mx 					: clear bookmarks in all buffers								:BookmarkClearAll
" [count]mkk  : move up bookmark at current line							:BookmarkMoveUp [<COUNT>]
" [count]mjj	: move down bookmark at current line						:BookmarkMoveDown [<COUNT>]
" [count]mg 	: move bookmark at current line to another line	:BookmarkMoveToLine <LINE>
" Save all bookmarks to a file		:BookmarkSave <FILE_PATH>
" Load bookmarks from a file			:BookmarkLoad <FILE_PATH>

" "airblade/vim-gitgutter"
" ]c  	: jump to next hunk (change)
" [c  	: jump to previous hunk (change)
" \hs 	: stage the hunk with
" \hu 	: undo the hunk
" \hp 	: preview the hunk
" \hd   : open vim-diff
" \hf		: toggle folding unchanged
noremap <leader>hd :GitGutterDiffOrig <CR> 
noremap <leader>hf :GitGutterFold <CR> 

" "default folding of vim"
" zo	: opens a fold underneath the cursor.
" zO	: opens all folds underneath the cursor, recursively.
" zc	: closes a fold underneath the cursor.
" zC	: closes all folds underneath the cursor, recursively.
" za	: toggles a fold under the cursor 
" 		(a closed fold is opened, an opened fold is closed).
" zM	: closes all folds in the buffer.
" zR	: opens all folds in the buffer.
" zm	: closes a level of fold in the buffer.
" zr	: opens a level of fold in the buffer.
