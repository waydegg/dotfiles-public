local ok, comment = pcall(require, "Comment")
if not ok then
	print("'Comment.nvim' not installed")
	return
end

comment.setup({
	mappings = false,
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
