local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("null-ls not installed correctly")
	return
end

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
