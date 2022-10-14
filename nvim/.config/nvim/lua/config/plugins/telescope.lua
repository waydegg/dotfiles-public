local ok, telescope = pcall(require, "telescope")
if not ok then
	print("'telescope' not installed")
	return
end

telescope.setup({})

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local colors = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "colors",
			finder = finders.new_table({
				results = { "red", "green", "blue" },
			}),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

-- colors()
