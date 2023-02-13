local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	print("'mason.nvim' not installed")
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	print("'mason-lspconfig.nvim' not installed")
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"pyright",
		"tsserver",
		"vimls",
		"rust_analyzer",
		"sqls",
		"html",
		"cssls",
		"vuels",
		"lua_ls",
	},
})
