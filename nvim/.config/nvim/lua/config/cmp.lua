local cmp = require("cmp")
local luasnip = require("luasnip")

local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

local function format_item(_, vim_item)
	vim_item.kind = cmp_kinds[vim_item.kind] or ""

	-- local entries = entry.entries
	-- if entries ~= nil and entries["get_completion_item:0"] ~= nil then
	--   local source = entries["get_completion_item:0"].detail
	--   vim_item.word = vim_item.word .. source
	-- end

	return vim_item
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<c-n>"] = cmp.mapping.select_next_item(),
		["<c-p>"] = cmp.mapping.select_prev_item(),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = format_item,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
})
