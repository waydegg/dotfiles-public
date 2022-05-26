local nvim_tree = require("nvim-tree")

nvim_tree.setup({
  view = {
    width = 40,
    mappings = {
      custom_only = true,
      list = {
        { key = "<cr>", action = "edit" },
        { key = "r", action = "rename" }, 
        { key = "d", action = "remove" },
        { key = "c", action = "cd" },
        { key = "C", action = "dir_up" },
        { key = "v", action = "vsplit" },
        { key = "b", action = "split" },
        { key = "a", action = "create" }
      }
    }
  }
})
