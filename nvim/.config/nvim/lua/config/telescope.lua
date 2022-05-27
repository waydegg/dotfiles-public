local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = { ".git" },
    path_display = function (opts, path)
      local filename = require("telescope.utils").path_tail(path)
      return string.format("%s %s", filename, path)
    end,
    dynamic_preview_title = true,
    results_title = false,
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

