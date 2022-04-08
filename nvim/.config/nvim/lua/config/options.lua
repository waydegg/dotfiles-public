local o = vim.o
local g = vim.g

o.clipboard = "unnamedplus"
o.number = true
o.numberwidth = 6
o.scrolloff = 8
o.sidescrolloff = 8
o.mouse = "a"
o.showmode = false
o.showtabline = 2
o.ignorecase = true
o.smartcase = true
o.splitbelow = true
o.undofile = true
o.updatetime = 300
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.cursorline = true
o.signcolumn = "yes"
o.termguicolors = true
o.formatoptions = "jtcroql"
o.foldlevelstart = 99
o.foldmethod = "expr"

-- DBUI
g.db_ui_winwidth = 50

-- Treesitter
o.foldexpr = "nvim_treesitter#foldexpr()"
