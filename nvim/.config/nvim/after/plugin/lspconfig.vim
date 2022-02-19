if !exists('g:lspconfig') | finish | endif


function MapCmpToBuffer()
  nnoremap <buffer> <silent> gD <cmd>lua vim.lsp.buf.declaration()<cr>
  echom "woof"
endfunction

lua << EOF
  local lspconfig = require("lspconfig")

  
  lspconfig.pyright.setup {
    filetypes = { "python" },
  }
EOF
