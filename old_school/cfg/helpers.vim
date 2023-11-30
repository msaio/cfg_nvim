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
