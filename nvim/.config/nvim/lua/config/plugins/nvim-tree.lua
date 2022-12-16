local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	print("'nvim-tree' not installed")
	return
end

nvim_tree.setup({
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 40,
		mappings = {
			custom_only = true,
			list = {
				{ key = "l", action = "edit" },
				{ key = "<cr>", action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "r", action = "rename" },
				{ key = "d", action = "remove" },
				{ key = "c", action = "cd" },
				{ key = "C", action = "dir_up" },
				{ key = "v", action = "vsplit" },
				{ key = "b", action = "split" },
				{ key = "a", action = "create" },
				{ key = "<c-r>", action = "refresh" },
				{ key = "x", action = "cut" },
				{ key = "p", action = "paste" },
			},
		},
	},
	renderer = {
		group_empty = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
	git = {
		enable = false,
	},
	filters = {
		custom = {
			"__pycache__",
			"venv",
			"*.egg-info",
			".parcel-cache",
			".pytest_cache",
			"node_modules",
			".git",
			"package-lock.json",
			".expo/web",
		},
		-- exclude = { ".gitignore", ".github" },
	},
})
