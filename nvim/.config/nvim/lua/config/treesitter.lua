local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
  ensure_installed = { 'vim', 'typescript', 'http', 'json', "fish", "python" },
  sync_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})
