local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	print("'nvim-tree' not installed")
	return
end

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<cr>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Remove"))
	vim.keymap.set("n", "c", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "C", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "b", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "<c-r>", api.tree.reload, opts("Reload"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
end

nvim_tree.setup({
	on_attach = on_attach,
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 40,
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
			"^venv$",
			"*.egg-info",
			".parcel-cache",
			".pytest_cache",
			"node_modules",
			"^.git$",
			"package-lock.json",
			".expo/web",
			"^\\.next",
		},
	},
})
