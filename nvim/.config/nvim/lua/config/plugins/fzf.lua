vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }

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
		".pytest_cache",
		".expo/web",
		".next",
		"data",
		"build",
	}
	local exclude_args = {}
	for _, pattern in ipairs(exclude_patterns) do
		local exclude_arg = "--exclude " .. pattern
		table.insert(exclude_args, exclude_arg)
	end
	local exclude_args_str = table.concat(exclude_args, " ")
	local command = "fd --type file --no-ignore --hidden " .. exclude_args_str

	local preview = "bat --color=always --style=plain {}"
	local options = {
		"--cycle",
		"--tiebreak=end",
		"--ansi",
		"--bind=change:first",
		"--bind=ctrl-d:preview-half-page-down",
		"--bind=ctrl-u:preview-half-page-up",
		"--preview=" .. preview,
	}

	vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
		source = command,
		sink = "e",
		options = options,
	}))
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
		".expo/web",
		"data",
		"build",
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

	local preview = "bat --style=plain --color=always {1} --highlight-line {2}"

	local options = {
		"--cycle",
		"--tiebreak=end",
		"--ansi",
		"--delimiter=:",
		"--bind=change:first",
		"--bind=ctrl-d:preview-half-page-down",
		"--bind=ctrl-u:preview-half-page-up",
		"--preview=" .. preview,
		"--preview-window=+{2}-10",
	}

	local function open_file_at_line(rg_query)
		local rg_parts = vim.split(rg_query, ":")
		vim.cmd("edit " .. rg_parts[1])
		vim.cmd(rg_parts[2])
	end

	vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
		source = command,
		sink = open_file_at_line,
		options = options,
	}))
end

vim.api.nvim_create_user_command("FzfFiles", fzf_files, {})
vim.api.nvim_create_user_command("FzfGrep", fzf_grep, {})
