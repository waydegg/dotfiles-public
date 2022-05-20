local telescope = require("telescope")

telescope.setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = { ".git" }
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--follow", "--hidden", "--files" }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

telescope.load_extension("fzy_native")
