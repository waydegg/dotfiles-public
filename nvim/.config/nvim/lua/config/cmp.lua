local cmp = require("cmp")

function format_handler(entry, vim_item)
  local vscode_icons = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
  }

  vim_item.kind = string.format("%s", vscode_icons[vim_item.kind])
  vim_item.menu = ({
    nvim_lsp = "[LSP]",
    buffer = "[Buffer]",
    path = "[Path]"
  })[entry.source.name]
  return vim_item
end

cmp.setup({
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
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" }
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

vim.cmd([[
  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]])


