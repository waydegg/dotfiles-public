-- Reload statusline on window/buffer change
vim.api.nvim_create_augroup("Statusline", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = "Statusline",
	callback = function()
		require("config.ui.statusline").setup()
	end,
})

-- Reload winbar on window/buffer change
vim.api.nvim_create_augroup("Winbar", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = "Winbar",
	callback = function()
		require("config.ui.winbar").setup()
	end,
})
