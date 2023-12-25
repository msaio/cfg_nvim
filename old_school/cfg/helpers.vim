" "Vimscript functions"
function! CurrentColorBoard()
	so $VIMRUNTIME/syntax/colortest.vim
endfunc

function! GetPath()
	let current_file = expand('%:p')	
	echo current_file | redraw
	return current_file
endfunc

function! YankPath()
	" let current_file = expand('%:p')
	" echo current_file | redraw
	" let @+ = current_file
	let current_path = GetPath()
	let @+ = current_path
endfunc

function! JumpToVscode()
	let current_file = bufname('%')
	if current_file == ''
		!code .
	else
		!code . | code %:p
	endif
endfunc

function! ToggleAutoSave()
  " Check if the buffer is associated with a file
  if expand('%:t') !=# ''  " Check if buffer has a filename
    if !exists('#Autosave#TextChanged')
      augroup Autosave
        autocmd!
        " Autosave when text changed
        autocmd TextChanged,TextChangedI <buffer> silent write
        " Autosave when exiting insert mode and move to other panes
        au InsertLeave,BufLeave * silent! wall
      augroup END
      echo "autosave ON"
    else
      augroup Autosave
        autocmd!
      augroup END
      echo "autosave OFF"
    endif
  else
    echo "This buffer is not associated with a file. Autosave not enabled."
  endif
endfunc

function! ToggleFoldMethod()
	if &foldmethod == 'manual'
		set foldmethod=indent
		echom "ToggleFoldMethod(): indent"
	else
		set foldmethod=manual
		echom "ToggleFoldMethod(): manual"
	endif
endfunc

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

function! RefreshCurrentBuffer()
	exec "checktime"
	exec "let @/ = ''"
  exec "let b:search_list = []"
  exec "let b:search_index = 0"
endfunc

function! SearchSelected()
  normal! gv"ay
	call feedkeys("/\\V" . escape(@a, '/\') . "\<CR>")
endfunction
" vnoremap // :call SearchSelected()<CR>
" Simple
" vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Explore more at 
" https://vim.fandom.com/wiki/Search_for_visually_selected_text

function! ReplaceSelected()
	let selected_text = @a
	let replacement_text = input('Replace with: ')
	if replacement_text == ''
		return
	endif
	echo "\n"
	execute '%s/'.selected_text.'/'.replacement_text.'/g'
endfunction

" "Lua functions"
function! InstallDefaultCocPlugins()
  luafile $NVIM_CFG_PATH/old_school/cfg/coc-extensions.lua
endfunction

luafile $NVIM_CFG_PATH/old_school/cfg/helpers.lua

function! LuaSearchSelected()
  lua SearchSelected() 
endfunction

function! LuaPreviousSearch()
  lua PreviousSearch() 
endfunction

function! LuaNextSearch()
  lua NextSearch() 
endfunction

function! LuaReplaceSelected()
  lua ReplaceSelected() 
endfunction

