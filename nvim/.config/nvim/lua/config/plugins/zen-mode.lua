local ok, zen_mode = pcall(require, "zen-mode")
if not ok then
	print("'zen-mode.nvim' not installed")
	return
end

zen_mode.setup({
	window = {
		backdrop = 1,
		width = 100,
		height = 0.95,
		options = {
			number = false,
		},
	},
})
