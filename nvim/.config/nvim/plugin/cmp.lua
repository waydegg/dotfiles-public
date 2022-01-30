local cmp = require("cmp")
local luasnip = require("luasnip")

-- Maybe remove this?
require("luasnip/loaders/from_vscode").lazy_load()

function expand_handler(args)
  luasnip.lsp_expand(args.body)
end

function format_handler(entry, vim_item)
  local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }
  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
  vim_item.menu = ({
    nvim_lsp = "[LSP]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]"
  })[entry.source.name]
  return vim_item
end

cmp.setup({
  snippet = {
    expand = expand_handler
  },
  mapping = {
    ["<c-k>"] = cmp.mapping.select_prev_item(),
    ["<c-j>"] = cmp.mapping.select_next_item(),
    ["<cr>"] = cmp.mapping.confirm { select = true }
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = format_handler
  },
  sources = {
    { name = "luasnip" },
    { name = "buffer" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {
    ghost_text = true
  }
})





