local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
	ensure_installed = { "vim", "typescript", "http", "json", "fish", "python", "lua" },
	sync_install = true,
	highlight = {
		enable = false,
	},
	indent = {
		enable = true,
	},
})
