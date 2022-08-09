local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
	print("'treesitter' not installed")
	return
end

local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
	ensure_installed = {
		"vim",
		"typescript",
		"http",
		"json",
		"fish",
		"python",
		"lua",
		"tsx",
		"html",
		"yaml",
		"javascript",
		"css",
	},
	sync_install = true,
	highlight = {
		enable = false,
	},
	indent = {
		enable = false,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
