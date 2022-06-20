local ok, comment = pcall(require, "Comment")
if not ok then
	print("comment.nvim is not installed correctly")
end

comment.setup({
	mappings = false,
})
