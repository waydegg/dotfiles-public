vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function remap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end

-- Disable normal space
remap("n", "<space>", "<nop>")

-- Escape normal mode
remap("i", "jk", "<esc>l")
remap("i", "<esc>", "<nop>")

-- Select all
remap("n", "<c-a>", "ggVG")

-- Better window navigation
remap("n", "<c-h>", "<c-w>h")
remap("n", "<c-j>", "<c-w>j")
remap("n", "<c-k>", "<c-w>k")
remap("n", "<c-l>", "<c-w>l")
remap("n", "<c-w>h", "<nop>")
remap("n", "<c-w>j", "<nop>")
remap("n", "<c-w>k", "<nop>")
remap("n", "<c-w>l", "<nop>")

-- Horizontal split
remap("n", "<c-w>b", "<c-w>s")

-- Stay in indent mode
remap("v", "<", "<gv")
remap("v", ">", ">gv")

-- Disable paste from overriding register/clipboard
remap("v", "p", "_dP")

-- Toggle maximizing a window
vim.cmd([[
  function ToggleMaximizedWindow()
    if exists('t:zoomed') && t:zoomed
      execute t:zoom_winrestcmd
      let t:zoomed = 0
    else
      let t:zoom_winrestcmd = winrestcmd()
      resize
      vertical resize
      let t:zoomed = 1
    endif
  endfunction
 command ToggleMaximizedWindow call ToggleMaximizedWindow()
]])
remap("n", "<leader>m", ":ToggleMaximizedWindow<cr>")

-- Navigate buffers
remap("n", "<s-h>", ":bprevious<cr>")
remap("n", "<s-l>", ":bnext<cr>")

-- Close the current buffer
remap("n", "<leader>cb", ":bp<bar>sp<bar>bn<bar>bd<cr>") 

-- Commentary
remap("n", "gc", ":Commentary<cr>")
remap("v", "gc", ":Commentary<cr>")

-- Gitsigns
remap("n", "<leader>gh", ":Gitsigns preview_hunk<cr>")
remap("n", "<leader>gb", ":Gitsigns blame_line<cr>")

-- Nvim Tree
remap("n", "<leader>e", ":NvimTreeToggle<cr>")

-- LSP
remap("n", "gd", ":lua vim.lsp.buf.definition()<cr>")
remap("n", "gh", ":lua vim.lsp.buf.hover()<cr>")
remap("n", "gl", ":lua vim.diagnostic.open_float({ border = 'rounded' })<cr>")
remap("n", "gn", ":lua vim.diagnostic.goto_next({ border = 'rounded' })<cr>")
remap("n", "gp", ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<cr>")

-- Telescope
remap("n", "<leader>ff", ":Telescope find_files<cr>")
remap("n", "<leader>fg", ":Telescope live_grep<cr>")

-- Hop
remap("n", "f", ":HopWord<cr>")

-- DAP
remap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>")
remap("n", "<leader>da", ":lua require('debugHelper').attach()<cr>")
remap("n", "<leader>dc", ":lua require('dap').continue()<cr>")
remap("n", "<leader>do", ":lua require('dap').step_over()<cr>")
remap("n", "<leader>dx", ":lua require('dap').terminate()<cr>")

-- File Explorer
remap("n", "<leader>e", "<cmd>CHADopen<cr>")
