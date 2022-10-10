set nocompatible
set number relativenumber
set nu rnu
set encoding=utf8


" change the leader key from "\" to <space>
let mapleader=" "


lua require('plugins')
lua require('setup')
lua require('nvim-cmp')
lua require('tree-sitter')
" lua require('toggleterm')

nnoremap <leader>v <cmd>CHADopen<cr>

" Buffer
" close it with out closing window
command! BD :bn|:bd#
noremap <Leader>bd :BD<CR>
noremap <Leader>bn :bn<CR>
noremap <Leader>bp :bp<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>

" Clipboard functionality (paste from system)
noremap <leader>y "+y
vnoremap <leader>y "+y
noremap <leader>p "+p
vnoremap <leader>p "+p

"let g:vsnip_filetypes.go = ['go']

autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType go setlocal tabstop=4

