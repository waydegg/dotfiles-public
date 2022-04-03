-- Plugin manager
require "config.packer"

-- Plugin setup

-- Neovim & plugin config
require "config.options"
require "config.keymaps"
require "config.autocommands"
require "config.colorschemes"

-- Plugins
require "config.plugins.cmp"
require "config.plugins.hop"
require "config.plugins.telescope"
require "config.plugins.gitsigns"
require "config.plugins.bufferline"
require "config.plugins.dap"
require "config.plugins.lspconfig"
require "config.plugins.alpha"
