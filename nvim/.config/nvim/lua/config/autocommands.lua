vim.cmd([[
  augroup highlight_yank
      autocmd!
      au textyankpost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
  augroup END
]])
