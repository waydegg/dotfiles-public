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
		formatting.black,
		formatting.prettier,
		formatting.stylua,
		formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		formatting.isort,
		autoflake,
	},
	on_attach = function(client, bufnr)
		-- Format on save
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
