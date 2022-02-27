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
