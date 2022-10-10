local ok, outline = pcall(require, "symbols-outline")
if not ok then
	print("'symbols-outline' not installed")
	return
end

outline.setup({
	width = 15,
	symbol_blacklist = { "Variable", "Property", "Constant" },
})
