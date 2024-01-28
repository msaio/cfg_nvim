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
badd +25 old_school/personal.vim
badd +77 old_school/cfg/default.vim
badd +119 old_school/cfg/helpers.vim
badd +169 old_school/cfg/keymaps.vim
badd +1 old_school/cfg/overwrite.vim
badd +196 old_school/cfg/plugins.vim
badd +14 old_school/init.vim
badd +9 init.lua
badd +28 old_school/cfg/helpers.lua
badd +224 lua/plugins/example.lua
badd +26 old_school/plugin.vim
badd +14 old_school/cfg/coc-extensions.lua
badd +1 old_school/cheatsheet.json
badd +12 old_school/theme.vim
badd +80 /usr/share/nvim/runtime/syntax/colortest.vim
badd +23 old_school/personal.vim.bk
badd +1 old_school/cfg/FAR\ 2
badd +1 FAR\ 4
badd +7 FAR\ 6
badd +27 coc-settings.json.bk
badd +3 lua/config/keymaps.lua
argglobal
%argdel
$argadd old_school/personal.vim
edit old_school/cfg/keymaps.vim
argglobal
balt lua/config/keymaps.lua
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
let s:l = 127 - ((1 * winheight(0) + 39) / 78)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 127
normal! 030|
lcd ~/cfg_nvim
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
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
