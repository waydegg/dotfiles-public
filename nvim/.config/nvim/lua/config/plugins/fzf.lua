local function fzf_files()
	-- Source
	local base = "fd --type file --no-ignore --hidden"

	local exclude_patterns = {
		".git",
		"node_modules",
		"dist",
		"tmpdata",
		"venv",
		"__pycache__",
		"__tests__",
		".parcel-cache",
	}
	local exclude_args = {}
	for _, pattern in ipairs(exclude_patterns) do
		local exclude_arg = "--exclude " .. pattern
		table.insert(exclude_args, exclude_arg)
	end
	local exclude_args_str = table.concat(exclude_args, " ")

	local source = table.concat({ base, exclude_args_str }, " ")

	vim.fn["fzf#run"]({
		options = "--cycle --tiebreak=end",
		source = source,
		sink = "e",
		window = { width = 0.9, height = 0.6 },
	})
end

vim.api.nvim_create_user_command("FzfFiles", fzf_files, {})
