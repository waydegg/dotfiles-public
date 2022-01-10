local fn = vim.fn

-- Install Packer if not installed already
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing Packer. Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Verify that Packer install is healthy
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Unable to load Packer!"
  return
end

-- Have Packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
 
  -- Colorscheme
  use "overcache/NeoSolarized"

  -- Completions
  use "hrsh7th/nvim-cmp" 
  use "hrsh7th/cmp-buffer" 
  use "hrsh7th/cmp-path" 
  use "hrsh7th/cmp-cmdline" 
  use "saadparwaiz1/cmp_luasnip" 

  -- Snippets
  use "L3MON4D3/LuaSnip" 

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
