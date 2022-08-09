local lsp_installed_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installed_ok then
	print("'nvim-lsp-installer' not installed")
	return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	print("'lspconfig' not installed")
	return
end

local typescript_ok, typescript = pcall(require, "typescript")
if not typescript_ok then
	print("'typescript' not installed")
	return
end

-- Diagnostic signs
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	signs = {
		active = signs,
	},
	severity_sort = true,
	float = {
		border = true,
	},
})

-- UI
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded",
-- 	width = 60,
-- })
--
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
-- 	vim.lsp.handlers.signature_help,
-- 	{
-- 		border = "rounded",
-- 		width = 60,
-- 	}
-- )

-- local border = {
-- 	{ "🭽", "FloatBorder" },
-- 	{ "▔", "FloatBorder" },
-- 	{ "🭾", "FloatBorder" },
-- 	{ "▕", "FloatBorder" },
-- 	{ "🭿", "FloatBorder" },
-- 	{ "▁", "FloatBorder" },
-- 	{ "🭼", "FloatBorder" },
-- 	{ "▏", "FloatBorder" },
-- }
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or border
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = border }
	),
}
-- LSP server setup
local servers = {
	"pyright",
	"tsserver",
	"vimls",
	"sumneko_lua",
	"rust_analyzer",
	"sqls",
	"html",
	"cssls",
}
lsp_installer.setup({
	ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_ok then
	print("'cmp_nvim_lsp' not installed")
	return
end
capabilities = cmp_lsp.update_capabilities(capabilities)

lspconfig.pyright.setup({
	capabilities = capabilities,
	filetypes = { "python" },
	handlers = handlers,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		filetypes = { "typescript", "typescriptreact", "javascript" },
		on_attach = function(client)
			client.server_capabilities.document_formatting = false
		end,
	},
})

lspconfig.vimls.setup({
	capabilities = capabilities,
	filetypes = { "vim" },
})

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	filetypes = { "rust" },
})

lspconfig.html.setup({
	capabilities = capabilities,
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	filetypes = { "css", "scss", "less" },
})

-- Setup ufo (depends on lspconfig)
local ufo_ok, ufo = pcall(require, "ufo")
if not ufo_ok then
	print("'ufo' not installed")
	return
end

ufo.setup()
