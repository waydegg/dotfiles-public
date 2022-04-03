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

local packer = require("packer")

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

-- Setup Packer
packer.startup(function (use)
  use "wbthomason/packer.nvim"

  -- Core
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"

  -- Colorschemes
  use "NLKNguyen/papercolor-theme"

  -- LSP
  use "neovim/nvim-lspconfig"

  -- Completions
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "kristijanhusak/vim-dadbod-completion"
  use "ms-jpq/coq_nvim"

  -- Syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- CHAD Tree
  use { "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- DAP 
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Hop
  use { 'phaazon/hop.nvim', branch = 'v1' }

  -- Misc
  use "lewis6991/gitsigns.nvim"
  use "akinsho/bufferline.nvim"
  use "tpope/vim-surround"
  use "goolord/alpha-nvim"

  -- use "lukas-reineke/indent-blankline.nvim"
  use "folke/trouble.nvim"
  use "folke/lsp-colors.nvim"

end)

