syntax enable
set sw=4
set ts=4
set expandtab
set smartindent
set nu

" syntax folding, prevent auto fold
set foldmethod=syntax
set nofoldenable
let Tlist_Auto_Open = 1

" allow switching buffer without saving
set hidden

let mapleader=","

" map Option+? to Ctrl+?
map ƒ <C-f>
map ∂ <C-d>
map ∑ <C-w>
map † <C-t>

"imap  <F1> <C-O>:tabprevious<CR>
"imap  <F2> <C-O>:tabnext<CR>
"nmap  <F1> :tabprevious<CR>
"nmap  <F2> :tabnext<CR>

imap  <F1> <C-O>:bp<CR>
imap  <F2> <C-O>:bn<CR>
nmap  <F1> :bp<CR>
nmap  <F2> :bn<CR>

" quickfix window
nnoremap <leader>cw :cw<CR>
nnoremap <leader>ccl :ccl<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>

autocmd FileType c,cpp,python,ruby,perl,java autocmd BufWritePre <buffer> :%s/\s\+$//e
filetype plugin indent on

" colors
colorscheme molokai
"hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=White
hi TabLineSel ctermfg=Red ctermbg=White

" gvim config
set gfn=DejaVu\ Sans\ Mono\ Bold\ 12
set guioptions-=T " remove toolbar
set linespace=3
