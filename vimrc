syntax enable
set sw=4
set ts=4
set expandtab
set smartindent
set nu
let Tlist_Auto_Open = 1


" map Option+? to Ctrl+?
map ƒ <C-f>
map ∂ <C-d>
map ∑ <C-w>
map † <C-t>

colorscheme delek
autocmd FileType c,cpp,python,ruby,perl,java autocmd BufWritePre <buffer> :%s/\s\+$//e
