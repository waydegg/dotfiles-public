local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("null-ls is not installed correctly")
	return
end
local helpers = require("null-ls.helpers")

-- Custom sources
local autoflake = {
	name = "autoflake",
	method = null_ls.methods.FORMATTING,
	filetypes = { "python" },
	generator = helpers.formatter_factory({
		command = "autoflake",
		args = {
			"--remove-all-unused-imports",
			"--stdout",
			"$FILENAME",
		},
	}),
}

local formatting = null_ls.builtins.formatting
table.insert(formatting.prettier.filetypes, "yml")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- autoflake,
		formatting.black,
		formatting.isort,
		formatting.prettier,
		formatting.stylua,
		-- TODO: add trailing semicolon to queries, show some kind of error
		-- message for failed queries this is a pgcli thing maybe),
		-- disable column name formatting from
		-- camel to snake case (mabe when wrapped w/ quotation marks)
		-- -- SQL
		-- formatting.sqlfluff.with({
		-- 	extra_args = { "--dialect", "postgres" },
		-- }),
		-- TOML
		formatting.taplo,
	},
	on_attach = function(client, bufnr)
		-- Format on save
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
