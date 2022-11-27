local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	print("'treesitter' not installed")
	return
end

treesitter.setup({
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
