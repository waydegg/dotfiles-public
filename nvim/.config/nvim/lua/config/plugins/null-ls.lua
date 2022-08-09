local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("'null-ls' not installed")
	return
end

local helpers = require("null-ls.helpers")
local formatting = null_ls.builtins.formatting
local methods = null_ls.methods

local autoflake = {
	name = "autoflake",
	method = methods.FORMATTING,
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

local prettier = formatting.prettier.with({
	extra_filetypes = { "yml" },
	-- disabled_filetypes = { "markdown" },
	args = function(params)
		local args = { "--stdin-filepath", "$FILENAME" }

		if vim.o.ft == "markdown" then
			args = {
				"--prose-wrap",
				"always",
				"--print-width",
				"88",
				"--stdin-filepath",
				"$FILENAME",
			}
		end

		return args
	end,
})

-- TODO: add trailing semicolon to queries, show some kind of error
-- message for failed queries this is a pgcli thing maybe),
-- disable column name formatting from
-- camel to snake case (mabe when wrapped w/ quotation marks)
local sqlfluff = formatting.sqlfluff.with({
	extra_args = { "--dialect", "postgres" },
})

null_ls.setup({
	sources = {
		-- autoflake,
		formatting.black,
		formatting.isort,
		prettier,
		formatting.stylua,
		sqlfluff,
		formatting.taplo,
	},
	on_attach = function(client, bufnr)
		-- Format on save
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = "LspFormatting",
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
