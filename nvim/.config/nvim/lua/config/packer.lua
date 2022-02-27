-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Setup Packer
require("packer").startup(function (use)
  use "wbthomason/packer.nvim"

  -- Core
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"

  -- Colorschemes
  use "overcache/NeoSolarized"
  use "gruvbox-community/gruvbox"
  use "joshdick/onedark.vim"
  use "lunarvim/darkplus.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"

  -- Completions
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "kristijanhusak/vim-dadbod-completion"

  -- Syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "dag/vim-fish"

  -- Bufferline
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"

  -- NVIM Tree
  use "kyazdani42/nvim-tree.lua"

  -- Dadbod
  use "tpope/vim-dadbod"
  use "kristijanhusak/vim-dadbod-ui"

  -- Trouble
  use "folke/trouble.nvim"
  use "folke/lsp-colors.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = { { 'nvim-telescope/telescope.nvim' } },
    run = 'make',
  }

  use "tpope/vim-fugitive"

  use "lewis6991/gitsigns.nvim"

  use "NTBBloodbath/rest.nvim"
end)

