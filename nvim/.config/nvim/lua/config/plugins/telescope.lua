local telescope = require("telescope")

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git" }
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--follow", "--hidden", "--files" }
    }
  }
})

telescope.load_extension("fzf")
