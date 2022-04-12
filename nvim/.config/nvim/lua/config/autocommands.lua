vim.cmd([[
  augroup highlight_yank
      autocmd!
      au textyankpost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
  augroup END
]])

vim.cmd([[
  augroup set_fish_commentstring
    autocmd!
    autocmd FileType fish setlocal commentstring=#\ %s
  augroup END
]])

vim.cmd([[
  augroup treesitter_folding_fix
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zM zR
  augroup END
]])
