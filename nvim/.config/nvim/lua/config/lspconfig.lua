local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local servers = { "pyright", "tsserver", "vimls", "sumneko_lua", "rust_analyzer" }
lsp_installer.setup({
	ensure_installed = servers
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lspconfig.pyright.setup {
  filetypes = { "python" },
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
}

lspconfig.vimls.setup {
  capabilities = capabilities,
  filetypes = { "vim" }
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false
      }
    }
  }
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  filetypes = { "rust" }
}
