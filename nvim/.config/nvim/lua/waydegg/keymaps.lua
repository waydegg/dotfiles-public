local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move the current line up
keymap("n", "_", "kddpk", opts)

-- Move the current line down
keymap("n", "-", "ddp", opts)

-- -- Edit init.lua
-- keymap("n", "<leader>ev", ":vsplit $MYVIMRC<cr>", opts)

-- Source init.lua
keymap("n", "<leader>sv", ":source $MYVIMRC<cr>", opts)

-- Escape Normal mode
keymap("i", "jk", "<esc>", opts)
keymap("i", "<esc>", "<nop>", opts)

-- Open explorer
keymap("n", "<leader>e", ":Lexplore 30<cr>", opts)

-- Select all
keymap("n", "<C-a>", "ggVG", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Disable default window nav keymaps
keymap("n", "<C-w>h", "<nop>", opts)
keymap("n", "<C-w>j", "<nop>", opts)
keymap("n", "<C-w>k", "<nop>", opts)
keymap("n", "<C-w>w", "<nop>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Disable paste from overriding register/clipboard
keymap("v", "p", '"_dP', opts)






