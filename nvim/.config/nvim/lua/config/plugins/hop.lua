local ok, hop = pcall(require, "hop")
if not ok then
	print("'hop' not installed")
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})
