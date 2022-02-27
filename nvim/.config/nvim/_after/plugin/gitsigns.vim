nnoremap <silent> <leader>gh :Gitsigns preview_hunk<cr>
nnoremap <silent> <leader>gb :Gitsigns blame_line<cr>

lua << EOF
  require("gitsigns").setup()
EOF
