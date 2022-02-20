" Open file explorer
nnoremap <silent> <leader>e :NvimTreeToggle<cr>

lua << EOF
require'nvim-tree'.setup {
  hijack_cursor = false
}
EOF
