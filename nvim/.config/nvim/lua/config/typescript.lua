local ok, typescript = pcall(require, "typescript")
if not ok then
	print("typescript is not installed correctly")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

typescript.setup({
	server = {
		capabilities = capabilities,
		filetypes = { "typescript", "typescriptreact" },
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
})
