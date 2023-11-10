local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("'null-ls' not installed")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local prettier = formatting.prettier.with({
	extra_filetypes = { "yml" },
	args = function(_)
		local args = {
			"--config",
			vim.fn.getenv("HOME") .. "/.config/prettier/prettier.config.js",
			"--stdin-filepath",
			"$FILENAME",
		}

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

null_ls.setup({
	sources = {
		prettier,
		formatting.isort,
		formatting.stylua,
		formatting.taplo,
		diagnostics.fish,
		formatting.xmllint,
		formatting.sql_formatter,
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
