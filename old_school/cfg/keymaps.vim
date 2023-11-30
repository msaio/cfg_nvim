" C == Ctrl
" A == Alt
" \ == Leader

" <F1>			: toggle mouse
" <C-F1>		: source config <F25>
" <A-F1>		: toggle pastemode <F49>
" <S-F1>		: switch foldmode manual/indent <F13>

" <F2>		: toggle Nerdtree
" <C-F2>	: reset Nerdtree <F26>
" <A-F2>	: open current buffer/file to VSCode <F50>
" "
map <F2> :NERDTreeToggle<CR>
map <F26> :NERDTree<CR>
noremap <F50> :call JumpToVscode() <CR>


" <F3><F3>		:
" <C-F3>			:  <F27>
" <A-F3>			: <F51>
" <S-F3>			: Toggle vim obsession track/pause <F15>
" <S-F3> x2		: Toggle vim obsession track/delete <F15><F15>
" "
noremap <F15> :Obsess <CR>
noremap <F15><F15> :Obsess! <CR>

" <F4><F4>  :
" <C-F4>		: <F28>
" <A-F4>		: open Bdelete menu <F52>
" <S-F4>		: <F16>
" 
nnoremap <silent> <F52> :Bdelete menu<CR>

" "tpope/vim-repeat"
" . (dot/period/fullstop):  works like @record

" "tpope/vim-surround"
" cs"'    :replace inside " with '
" cs'<q>  :replace inside ' with <q>
" cst"    : go full circle "
" ds"     : remove delimiters entirely "
" ysiw" 	: put word at cursir in "
" cs]{ 		: replace ] with { + space 
" cs]} 		: replace ] with { + no space
" yss" 		: put current line into "
" The . command will work with ds, cs, and yss if you install repeat.vim.

" "MattesGroeger/vim-bookmarks"
" mm					:Add/remove bookmark at current line  					:BookmarkToggle
" mi	    		:Add/edit/remove annotation at current line  		:BookmarkAnnotate <TEXT>
" mn	    		:Jump to next bookmark in buffer 								:BookmarkNext
" mp  				:Jump to previous bookmark in buffer						:BookmarkPrev
" ma					:Show all bookmarks (toggle)										:BookmarkShowAll
" mc 					:Clear bookmarks in current buffer only					:BookmarkClear
" mx 					:Clear bookmarks in all buffers									:BookmarkClearAll
" [count]mkk  :Move up bookmark at current line								:BookmarkMoveUp [<COUNT>]
" [count]mjj	:Move down bookmark at current line							:BookmarkMoveDown [<COUNT>]
" [count]mg 	:Move bookmark at current line to another line	:BookmarkMoveToLine <LINE>
" Save all bookmarks to a file		:BookmarkSave <FILE_PATH>
" Load bookmarks from a file			:BookmarkLoad <FILE_PATH>

" "airblade/vim-gitgutter"
" ]c  	:jump to next hunk (change)
" [c  	:jump to previous hunk (change)
" \hs 	:stage the hunk with
" \hu 	:undo the hunk
" \hp 	:preview the hunk
" \hd   :open vim-diff
" \hf		:toggle folding unchanged
" "
noremap <leader>hd :GitGutterDiffOrig <CR> 
noremap <leader>hf :GitGutterFold <CR> 

" "default folding of vim"
" zo	:opens a fold underneath the cursor.
" zO	:opens all folds underneath the cursor, recursively.
" zc	:closes a fold underneath the cursor.
" zC	:closes all folds underneath the cursor, recursively.
" za	:toggles a fold under the cursor (a closed fold is opened, an opened fold is closed).
" zM	:closes all folds in the buffer.
" zR	:opens all folds in the buffer.
" zm	:closes a level of fold in the buffer.
" zr	:opens a level of fold in the buffer.
