let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/cfg_nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +436 old_school/personal.vim
badd +77 old_school/cfg/default.vim
badd +119 old_school/cfg/helpers.vim
badd +127 old_school/cfg/keymaps.vim
badd +1 old_school/cfg/overwrite.vim
badd +253 old_school/cfg/plugins.vim
badd +14 old_school/init.vim
badd +9 init.lua
badd +28 old_school/cfg/helpers.lua
badd +224 lua/plugins/example.lua
badd +32 old_school/plugin.vim
badd +14 old_school/cfg/coc-extensions.lua
badd +1 old_school/cheatsheet.json
badd +4 old_school/theme.vim
badd +80 /usr/share/nvim/runtime/syntax/colortest.vim
argglobal
%argdel
$argadd old_school/personal.vim
edit old_school/theme.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 116 + 118) / 236)
exe 'vert 2resize ' . ((&columns * 119 + 118) / 236)
argglobal
balt old_school/plugin.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 013|
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/plugin.vim", ":p")) | buffer ~/cfg_nvim/old_school/plugin.vim | else | edit ~/cfg_nvim/old_school/plugin.vim | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/plugin.vim
endif
balt ~/cfg_nvim/old_school/cfg/plugins.vim
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 41 - ((9 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 41
normal! 010|
lcd ~/cfg_nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 116 + 118) / 236)
exe 'vert 2resize ' . ((&columns * 119 + 118) / 236)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
