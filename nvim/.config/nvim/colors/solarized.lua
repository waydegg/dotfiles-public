local colors = {
	base03 = "#002b36",
	base02 = "#073642",
	base01 = "#586e75",
	base00 = "#657b83",
	base0 = "#839496",
	base1 = "#93a1a1",
	base2 = "#eee8d5",
	base3 = "#fdf6e3",
	yellow = "#b58900",
	orange = "#cb4b16",
	red = "#dc322f",
	magenta = "#d33682",
	violet = "#6c71c4",
	blue = "#268bd2",
	cyan = "#2aa198",
	green = "#859900",
}

-- Used this website: https://pinetools.com/darken-color
local colors_darker = {
	base3_5 = "#fbeecc",
}

-- Used this website: https://pinetools.com/lighten-color
local colors_lighter = {
	base01_25 = "#7c949c",
}

vim.api.nvim_command("hi clear")

local set_hl = vim.api.nvim_set_hl

set_hl(0, "Normal", { fg = colors.base00, bg = colors.base3 })
set_hl(0, "Comment", { fg = colors.base01, italic = true })
set_hl(0, "Constant", { fg = colors.cyan })
set_hl(0, "Identifier", { fg = colors.blue })
set_hl(0, "Statement", { fg = colors.green })
set_hl(0, "PreProc", { fg = colors.orange })
set_hl(0, "Type", { fg = colors.yellow })
set_hl(0, "Special", { fg = colors.red })
set_hl(0, "Underlined", { fg = colors.violet })
set_hl(0, "Ignore", {})
set_hl(0, "Error", { fg = colors.red, bold = true })
set_hl(0, "Todo", { fg = colors.magenta, bold = true })
set_hl(0, "SpecialKey", { fg = colors.base2, bold = true })
set_hl(0, "NonText", { fg = colors.base2, bold = true })
set_hl(
	0,
	"Visual",
	{ fg = colors.base1, bg = colors.base3, reverse = true, bold = true }
)
set_hl(0, "Directory", { fg = colors.blue })
set_hl(0, "ErrorMsg", { fg = colors.red, reverse = true })
set_hl(0, "IncSearch", { fg = colors.orange, standout = true })
set_hl(0, "Search", { fg = colors.yellow, reverse = true })
set_hl(0, "MoreMsg", { fg = colors.blue })
set_hl(0, "ModeMsg", { fg = colors.blue })
set_hl(0, "LineNr", { fg = colors.base1 })
set_hl(0, "Question", { fg = colors.cyan, bold = true })
set_hl(0, "WinSeparator", { fg = colors.base0, bg = colors.base0 })
set_hl(0, "Title", { fg = colors.orange, bold = true })
set_hl(
	0,
	"VisualNOS",
	{ bg = colors.base2, standout = true, reverse = true, bold = true }
)
set_hl(0, "Warningmsg", { fg = colors.red, bold = true })
set_hl(
	0,
	"WildMenu",
	{ fg = colors.base02, bg = colors.base2, reverse = true, bold = true }
)
set_hl(
	0,
	"Folded",
	{ fg = colors.base00, bg = colors.base2, underline = true, sp = colors.base3 }
)
set_hl(0, "FoldedColumn", { fg = colors.base00, bg = colors.base2 })
set_hl(
	0,
	"DiffAdd",
	{ fg = colors.green, bg = colors.base2, bold = true, sp = colors.green }
)
set_hl(
	0,
	"DiffChange",
	{ fg = colors.yellow, bg = colors.base2, bold = true, sp = colors.yellow }
)
set_hl(0, "DiffDelete", { fg = colors.red, bg = colors.base2, bold = true })
set_hl(
	0,
	"DiffText",
	{ fg = colors.blue, bg = colors.base2, bold = true, sp = colors.blue }
)
set_hl(0, "SignColumn", { fg = colors.base00 })
set_hl(0, "Conceal", { fg = colors.blue })
set_hl(0, "SpellBad", { sp = colors.red, undercurl = true })
set_hl(0, "SpellCap", { sp = colors.violet, undercurl = true })
set_hl(0, "SpellRare", { sp = colors.cyan, undercurl = true })
set_hl(0, "SpellLocal", { sp = colors.yellow, undercurl = true })
set_hl(0, "Pmenu", { fg = colors.base00, bg = colors.base2, reverse = true })
set_hl(
	0,
	"PmenuSel",
	{ fg = colors.base1, bg = colors.base02, reverse = true, bold = true }
)
set_hl(
	0,
	"PmenuSbar",
	{ fg = colors.base02, bg = colors.base00, reverse = true, bold = true }
)
set_hl(
	0,
	"PmenuThumb",
	{ fg = colors.base00, bg = colors.base3, reverse = true, bold = true }
)
set_hl(
	0,
	"TabLine",
	{ fg = colors.base00, bg = colors.base2, sp = colors.base00, underline = true }
)
set_hl(
	0,
	"TabLineFill",
	{ fg = colors.base00, bg = colors.base2, sp = colors.base00, underline = true }
)
set_hl(0, "TabLineSel", {
	fg = colors.base1,
	bg = colors.base02,
	sp = colors.base00,
	underline = true,
	reverse = true,
	bold = true,
})
set_hl(0, "CursorColumn", { bg = colors.base2 })
set_hl(0, "CursorLine", { bg = colors.base2, sp = colors.base01 })
set_hl(0, "CursorColumn", { bg = colors.base2 })
set_hl(0, "Cursor", { fg = colors.base3, bg = colors.base00, link = "lCursor" })
set_hl(0, "MatchParen", { fg = colors.red, bg = colors.base1, bold = true })
set_hl(0, "EndOfBuffer", { fg = colors.base3, bg = colors.base3 })

-- CMP
set_hl(0, "CmpItemAbbrDeprecated", { fg = "#808080", strikethrough = true })
set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6" })
set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })
set_hl(0, "CmpItemKindVariable", { fg = "#76B6D8" })
set_hl(0, "CmpItemKindInterface", { fg = "#76B6D8" })
set_hl(0, "CmpItemKindText", { fg = "#76B6D8" })
set_hl(0, "CmpItemKindFunction", { fg = "#C586C0" })
set_hl(0, "CmpItemKindMethod", { fg = "#C586C0" })
set_hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4" })
set_hl(0, "CmpItemKindProperty", { fg = "#D4D4D4" })
set_hl(0, "CmpItemKindUnit", { fg = "#D4D4D4" })

-- Nvim Tree
set_hl(0, "NvimTreeNormal", { fg = colors.base00, bg = colors_darker.base3_5 })
set_hl(
	0,
	"NvimTreeEndOfBuffer",
	{ fg = colors_darker.base3_5, bg = colors_darker.base3_5 }
)
set_hl(0, "NvimTreeWinSeparator", { fg = colors.base0, bg = colors.base0 })

-- GitSigns
set_hl(0, "GitSignsAdd", { fg = "#859900", bg = colors.base3 })
set_hl(0, "GitSignsChange", { fg = "#b58900", bg = colors.base3 })
set_hl(0, "GitSignsDelete", { fg = "#dc322f", bg = colors.base3 })

-- Statusline
set_hl(0, "StatusLine", { fg = colors.base01, bg = colors.base2, bold = true })
set_hl(
	0,
	"StatuslineGitBranch",
	{ fg = colors.base01, bg = colors.base2, reverse = true }
)
set_hl(0, "StatuslineDiagnosticError", { fg = "red", bg = colors.base2 })
set_hl(0, "StatuslineDiagnosticWarn", { fg = "orange", bg = colors.base2 })
set_hl(
	0,
	"StatuslineDiagnosticHint",
	{ fg = colors_lighter.base01_25, bg = colors.base2 }
)
set_hl(
	0,
	"StatuslineDiagnosticInfo",
	{ fg = colors_lighter.base01_25, bg = colors.base2 }
)

-- Winbar
set_hl(0, "WinBar", { fg = colors.base01, bg = colors.base2, bold = true })
