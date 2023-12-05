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
badd +393 old_school/personal.vim
badd +1 old_school/cfg/default.vim
badd +92 old_school/cfg/helpers.vim
badd +80 old_school/cfg/keymaps.vim
badd +1 old_school/cfg/overwrite.vim
badd +193 old_school/cfg/plugins.vim
badd +7 old_school/init.vim
badd +3 init.lua
badd +51 old_school/cfg/helpers.lua
badd +224 lua/plugins/example.lua
badd +25 old_school/plugin.vim
badd +22 old_school/cfg/coc-extensions.lua
argglobal
%argdel
$argadd old_school/personal.vim
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit old_school/personal.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
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
exe '1resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 118 + 118) / 236)
exe '2resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 236)
exe '3resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 117 + 118) / 236)
exe '4resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 4resize ' . ((&columns * 117 + 118) / 236)
argglobal
setlocal fdm=manual
setlocal fde=gitgutter#fold#level(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 412 - ((20 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 412
normal! 0
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/cfg/coc-extensions.lua", ":p")) | buffer ~/cfg_nvim/old_school/cfg/coc-extensions.lua | else | edit ~/cfg_nvim/old_school/cfg/coc-extensions.lua | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/cfg/coc-extensions.lua
endif
balt ~/cfg_nvim/old_school/personal.vim
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
let s:l = 10 - ((9 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 019|
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/init.vim", ":p")) | buffer ~/cfg_nvim/old_school/init.vim | else | edit ~/cfg_nvim/old_school/init.vim | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/init.vim
endif
balt ~/cfg_nvim/old_school/personal.vim
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
let s:l = 14 - ((13 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 019|
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/init.lua", ":p")) | buffer ~/cfg_nvim/init.lua | else | edit ~/cfg_nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/init.lua
endif
balt ~/cfg_nvim/old_school/init.vim
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
let s:l = 9 - ((8 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 03|
lcd ~/cfg_nvim
wincmd w
exe '1resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 118 + 118) / 236)
exe '2resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 236)
exe '3resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 117 + 118) / 236)
exe '4resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 4resize ' . ((&columns * 117 + 118) / 236)
tabnext
edit ~/cfg_nvim/old_school/cfg/default.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
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
exe '1resize ' . ((&lines * 17 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 118 + 118) / 236)
exe '2resize ' . ((&lines * 17 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 236)
exe '3resize ' . ((&lines * 17 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 118 + 118) / 236)
exe 'vert 4resize ' . ((&columns * 117 + 118) / 236)
argglobal
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
let s:l = 38 - ((8 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 026|
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/cfg/plugins.vim", ":p")) | buffer ~/cfg_nvim/old_school/cfg/plugins.vim | else | edit ~/cfg_nvim/old_school/cfg/plugins.vim | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/cfg/plugins.vim
endif
balt ~/cfg_nvim/old_school/cfg/default.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
1,20fold
21,24fold
25,40fold
41,51fold
52,94fold
95,106fold
107,117fold
118,127fold
128,163fold
let &fdl = &fdl
let s:l = 195 - ((4 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 195
normal! 029|
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/cfg/default.vim", ":p")) | buffer ~/cfg_nvim/old_school/cfg/default.vim | else | edit ~/cfg_nvim/old_school/cfg/default.vim | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/cfg/default.vim
endif
balt ~/cfg_nvim/old_school/cfg/plugins.vim
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
let s:l = 37 - ((3 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 0
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/cfg/keymaps.vim", ":p")) | buffer ~/cfg_nvim/old_school/cfg/keymaps.vim | else | edit ~/cfg_nvim/old_school/cfg/keymaps.vim | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/cfg/keymaps.vim
endif
balt ~/cfg_nvim/old_school/cfg/helpers.vim
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
let s:l = 88 - ((43 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 88
normal! 038|
lcd ~/cfg_nvim
wincmd w
exe '1resize ' . ((&lines * 17 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 118 + 118) / 236)
exe '2resize ' . ((&lines * 17 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 236)
exe '3resize ' . ((&lines * 17 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 118 + 118) / 236)
exe 'vert 4resize ' . ((&columns * 117 + 118) / 236)
tabnext
edit ~/cfg_nvim/old_school/cfg/helpers.lua
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
exe 'vert 1resize ' . ((&columns * 117 + 118) / 236)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 236)
argglobal
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
let s:l = 30 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 037|
lcd ~/cfg_nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/cfg_nvim/old_school/cfg/helpers.vim", ":p")) | buffer ~/cfg_nvim/old_school/cfg/helpers.vim | else | edit ~/cfg_nvim/old_school/cfg/helpers.vim | endif
if &buftype ==# 'terminal'
  silent file ~/cfg_nvim/old_school/cfg/helpers.vim
endif
balt ~/cfg_nvim/old_school/cfg/helpers.lua
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
let s:l = 92 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 92
normal! 014|
lcd ~/cfg_nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 117 + 118) / 236)
exe 'vert 2resize ' . ((&columns * 118 + 118) / 236)
tabnext 3
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
