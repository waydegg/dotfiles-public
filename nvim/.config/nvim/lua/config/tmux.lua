local ok, tmux = pcall(require, "tmux")
if not ok then
	print("tmux.nvim is not installed correctly")
	return
end

tmux.setup({
	navigation = {
		enable_default_keybindings = true,
		persist_zoom = true,
	},
})
