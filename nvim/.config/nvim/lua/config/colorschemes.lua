-- Neosolarized settings 
-- " let neosolarized_contrast = 'high'
-- " let neosolarized_termtrans = 1

-- vim.g.vscode_style = "dark"

-- colorscheme gruvbox
-- colorscheme NeoSolarized
vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme vscode")

vim.cmd([[
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])


-- " highlight! link CmpItemAbbrMatchFuzzy Aqua
-- " highlight! link CmpItemKindText Fg
-- " highlight! link CmpItemKindMethod Purple
-- " highlight! link CmpItemKindFunction Purple
-- " highlight! link CmpItemKindConstructor Green
-- " highlight! link CmpItemKindField Aqua
-- " highlight! link CmpItemKindVariable Blue
-- " highlight! link CmpItemKindClass Green
-- " highlight! link CmpItemKindInterface Green
-- " highlight! link CmpItemKindValue Orange
-- " highlight! link CmpItemKindKeyword Keyword
-- " highlight! link CmpItemKindSnippet Red
-- " highlight! link CmpItemKindFile Orange
-- " highlight! link CmpItemKindFolder Orange
