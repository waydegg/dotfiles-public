local lualine = require("lualine")

lualine.setup({
  options = {
    disabled_filetypes = { "NvimTree", "" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = {},
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      { "filename", path = 1 }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
})
