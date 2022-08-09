local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	print("'gitsigns' not installed")
	return
end

gitsigns.setup({})
