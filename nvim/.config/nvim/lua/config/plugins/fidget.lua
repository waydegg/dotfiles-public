local ok, fidget = pcall(require, "fidget")
if not ok then
	print("'fidget' not installed")
	return
end

fidget.setup({})
