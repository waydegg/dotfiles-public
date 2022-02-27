lua << EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'vim', 'typescript', 'http', 'json' },
    sync_install = true,
    highlight = { enable = true },
  }
EOF

set foldexpr=nvim_treesitter#foldexpr()
