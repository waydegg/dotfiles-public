vim.cmd [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=300}
  augroup END
]]
