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

" " gray
" highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" " blue
" highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
" highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" " light blue
" highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
" highlight! link CmpItemKindInterface CmpItemKindVariable
" highlight! link CmpItemKindText CmpItemKindVariable
" " pink
" highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
" highlight! link CmpItemKindMethod CmpItemKindFunction
" " front
" highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
" highlight! link CmpItemKindProperty CmpItemKindKeyword
" highlight! link CmpItemKindUnit CmpItemKindKeyword
