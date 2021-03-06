local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	view = {
		width = 40,
		mappings = {
			custom_only = true,
			list = {
				{ key = "<cr>", action = "edit" },
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
})
