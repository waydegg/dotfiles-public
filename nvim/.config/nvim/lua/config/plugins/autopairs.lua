local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	print("'nvim-autopairs' not installed")
	return
end

autopairs.setup({})
