local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_ok then
	print("'nvim-web-devicons' not installed")
end

local M = {}

M.winbar_filetype_exclude = { "NvimTree", "help", "Trouble" }

local function get_filename()
	local fileicon = ""
	if devicons_ok then
		fileicon = devicons.get_icon_by_filetype(vim.o.ft) or ""
	end

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
