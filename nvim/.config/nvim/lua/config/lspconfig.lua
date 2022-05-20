local lspconfig = require("lspconfig")

lspconfig.pyright.setup {
  filetypes = { "python" },
}

lspconfig.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
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
