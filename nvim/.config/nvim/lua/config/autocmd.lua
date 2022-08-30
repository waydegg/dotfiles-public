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

-- Highlight yank
vim.api.nvim_create_augroup("HighlightYank", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = "HighlightYank",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Null-ls format on save
vim.api.nvim_create_augroup("LspFormatting", { clear = true })

-- Set tmux filetype for all tmux conf files
vim.api.nvim_create_augroup("TmuxConf", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = "TmuxConf",
	pattern = "*/.config/tmux/conf/*.conf",
	callback = function()
		vim.bo.filetype = "tmux"
	end,
})

-- Reload tabline on tab change
vim.api.nvim_create_augroup("Tabline", { clear = true })
vim.api.nvim_create_autocmd({ "TabEnter" }, {
	group = "Tabline",
	callback = function()
		require("config.ui.tabline").setup()
	end,
})
