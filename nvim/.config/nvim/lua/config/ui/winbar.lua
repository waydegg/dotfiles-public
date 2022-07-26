local devicons = require("nvim-web-devicons")

local M = {}

M.winbar_filetype_exclude = { "", "NvimTree", "help", "Trouble" }

local function get_filename()
	local fileicon = devicons.get_icon_by_filetype(vim.o.ft) or ""

	return " " .. fileicon .. " %f%m %#Normal#"
end

M.setup = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return
	end

	vim.opt_local.winbar = get_filename()
end

return M
