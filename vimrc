syntax enable
set sw=4
set ts=4
set expandtab
set smartindent
set nu
let Tlist_Auto_Open = 1

" allow switching buffer without saving
set hidden

" map Option+? to Ctrl+?
map ƒ <C-f>
map ∂ <C-d>
map ∑ <C-w>
map † <C-t>

imap  <F1> <C-O>:tabprevious<CR>
imap  <F2> <C-O>:tabnext<CR>
nmap  <F1> :tabprevious<CR>
nmap  <F2> :tabnext<CR>

imap  <F3> <C-O>:bp<CR>
imap  <F4> <C-O>:bn<CR>
nmap  <F3> :bp<CR>
nmap  <F4> :bn<CR>

colorscheme delek
autocmd FileType c,cpp,python,ruby,perl,java autocmd BufWritePre <buffer> :%s/\s\+$//e
