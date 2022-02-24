nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gl <cmd>lua vim.diagnostic.open_float({ border = "rounded" })<cr>
nnoremap <silent> gn <cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>
nnoremap <silent> gp <cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>

lua << EOF
  local lspconfig = require("lspconfig")

  
  lspconfig.pyright.setup {
    filetypes = { "python" },
  }

  lspconfig.tsserver.setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  }
  
  lspconfig.vimls.setup {
    filetypes = { "vim" }
  }

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })
EOF

