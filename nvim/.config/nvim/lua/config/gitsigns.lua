local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	print("gitsigns is not installed correctly")
	return
end

gitsigns.setup({})
