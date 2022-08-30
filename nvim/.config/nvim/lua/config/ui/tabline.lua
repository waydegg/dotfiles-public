local M = {}

local function reload_tabline_label(tabpage_handle)
	local tabpage_number = vim.api.nvim_tabpage_get_number(tabpage_handle)

	local tablabel = ""

	-- Set tab index (not tab id!)
	tablabel = tablabel .. " " .. tabpage_number

	-- Set tab label
	local tablabel_name = vim.t[tabpage_handle].tablabel_name
	if tablabel_name ~= nil then
		tablabel = tablabel .. " " .. tablabel_name .. " "
	-- elseif vim.fn.expand("%:t") == "" then
	-- 	tablabel = tablabel .. " " .. vim.fn.expand("%:t") .. " "
	else
		tablabel = tablabel .. " [No Name] "
	end

	-- Set highlight group
	local current_tabpage_number = vim.api.nvim_tabpage_get_number(0)
	local handle_tabpage_number = vim.api.nvim_tabpage_get_number(tabpage_handle)
	if current_tabpage_number == handle_tabpage_number then
		tablabel = "%#TabLineSel#" .. tablabel .. "%#TabLine#"
	else
		tablabel = "%#TabLine#" .. tablabel
	end

	return tablabel
end

local function reload_tabline()
	local tabline = ""
	for _, tab_id in ipairs(vim.api.nvim_list_tabpages()) do
		tabline = tabline .. reload_tabline_label(tab_id)
	end
	vim.o.tabline = tabline
end

M.rename_tabline_label = function()
	vim.ui.input({ prompt = "Tabline Label: " }, function(input)
		vim.api.nvim_tabpage_set_var(0, "tablabel_name", input)
		reload_tabline()
	end)
end

M.setup = function()
	reload_tabline()
end

return M
