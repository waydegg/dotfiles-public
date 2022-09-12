local M = {}

M.statusline_filetype_exclude = { "", "NvimTree", "help", "Trouble", "fzf" }

local function align(alignment)
	if alignment == "right" then
		return "%="
	end
end

local function get_branch()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end

	return table.concat({
		" %#StatuslineGitBranch#",
		"  ",
		git_info.head,
		" %#Statusline# ",
	})
end

local function get_filename()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~")

	return table.concat({ " ", fpath, "%m " })
end

local function get_diagnostics()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " %#StatuslineDiagnosticError# " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = " %#StatuslineDiagnosticWarn# " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = " %#StatuslineDiagnosticHint# " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#StatuslineDiagnosticInfo# " .. count["info"]
	end

	return " " .. errors .. warnings .. hints .. info .. "%#StatusLine# "
end

local function get_filetype()
	return " " .. string.format(" %s ", vim.bo.filetype) .. " "
end

local function get_line_info()
	return " Ln %l, Col %c "
end

local function get_zoomed_status()
	if vim.t.zoomed == 1 then
		return " %#StatuslineGitBranch# ZOOM %#Statusline#  "
	end

	return ""
end

Statusline = {}

Statusline.setup = function()
	if vim.tbl_contains(M.statusline_filetype_exclude, vim.bo.filetype) then
		return ""
	end

	return table.concat({
		get_branch(),
		get_diagnostics(),
		get_filename(),
		align("right"),
		get_zoomed_status(),
		get_line_info(),
		get_filetype(),
	})
end

M.setup = function()
	vim.api.nvim_exec("setlocal statusline=%!v:lua.Statusline.setup()", true)
end

return M
