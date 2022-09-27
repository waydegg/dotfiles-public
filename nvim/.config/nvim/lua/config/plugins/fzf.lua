local function fzf_files()
	local exclude_patterns = {
		".git",
		"node_modules",
		"dist",
		"tmpdata",
		"venv",
		"__pycache__",
		"__tests__",
		".parcel-cache",
		"'*.egg-info'",
	}

	local exclude_args = {}
	for _, pattern in ipairs(exclude_patterns) do
		local exclude_arg = "--exclude " .. pattern
		table.insert(exclude_args, exclude_arg)
	end
	local exclude_args_str = table.concat(exclude_args, " ")

	local command = "fd --type file --no-ignore --hidden " .. exclude_args_str

	vim.fn["fzf#vim#files"](
		".",
		vim.fn["fzf#vim#with_preview"]({
			options = "--cycle --tiebreak=end",
			source = command,
			sink = "e",
			window = { width = 0.9, height = 0.6 },
		})
	)
end

local function fzf_buffers()
	vim.fn["fzf#vim#buffers"](vim.fn["fzf#vim#with_preview"]())
end

local function fzf_grep()
	local exclude_patterns = {
		".git",
		"node_modules",
		"dist",
		"tmpdata",
		"venv",
		"__pycache__",
		"__tests__",
		".parcel-cache",
		"'!*.egg-info'",
		"package-lock.json",
	}

	local exclude_args = {}
	for _, pattern in ipairs(exclude_patterns) do
		local exclude_arg = "--glob !" .. pattern
		table.insert(exclude_args, exclude_arg)
	end
	local exclude_args_str = table.concat(exclude_args, " ")

	local command = "rg --column --line-number --no-heading --color=always --smart-case "
		.. exclude_args_str
		.. " ."

	vim.fn["fzf#vim#grep"](command, 0, vim.fn["fzf#vim#with_preview"]())
end

vim.api.nvim_create_user_command("FzfFiles", fzf_files, {})
vim.api.nvim_create_user_command("FzfBuffers", fzf_buffers, {})
vim.api.nvim_create_user_command("FzfGrep", fzf_grep, {})
