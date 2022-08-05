local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local typescript = require("typescript")

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

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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
local ufo = require("ufo")
ufo.setup()
