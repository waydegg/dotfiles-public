local bufferline = require("bufferline")

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = "CHADTree",
        text = function()
          return "Explorer: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        end,
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
})
