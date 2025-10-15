local M = {}

local function reset()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
end

function M.setup(config)
	reset()

	config = config or {}
	local cc = config.colors or {}

	local colors = {
		smoky_black = cc.smoky_black or "#0C0C0C",
		eerie_black = cc.eerie_black or "#1A1A1A",
		raisin_black = cc.raisin_black or "#262626",

		dark_charcoal = cc.dark_charcoal or "#303030",
		gray = cc.gray or "#7E7E7E",
		quick_silver = cc.quick_silver or "#A5A5A5",
		chinese_silver = cc.chinese_silver or "#CCCCCC",
		anti_flash_white = cc.anti_flash_white or "#F2F2F2",
		white = cc.white or "#FFFFFF",
	}

	local palette = {
		selection = {
			foreground = colors.smoky_black,
			background = colors.anti_flash_white,
		},
		background = {
			medium = colors.smoky_black,
			brighter = colors.eerie_black,
			brightest = colors.raisin_black,
		},
		foreground = {
			darkest = colors.dark_charcoal,
			darker = colors.gray,
			dimmed = colors.quick_silver,
			medium = colors.chinese_silver,
			brighter = colors.anti_flash_white,
			brightest = colors.white,
		},
	}

	local groups = {
		normal = { fg = palette.foreground.medium, bg = palette.background.medium },
		selection = { fg = palette.selection.foreground, bg = palette.selection.background },

		darkest = { fg = palette.foreground.darkest },
		darker = { fg = palette.foreground.darker },
		darker_italic = { fg = palette.foreground.darker, italic = true },
		dimmed = { fg = palette.foreground.dimmed },
		dimmed_italic = { fg = palette.foreground.dimmed, italic = true },
		medium = { fg = palette.foreground.medium },
		medium_italic = { fg = palette.foreground.medium, italic = true },
		medium_underline = { fg = palette.foreground.medium, underline = true },
		brighter = { fg = palette.foreground.brighter },
		brighter_italic = { fg = palette.foreground.brighter, italic = true },
		brightest = { fg = palette.foreground.brightest },
		brightest_bold = { fg = palette.foreground.brightest, bold = true },
	}

	local highlight_groups = {
		["Normal"] = groups.normal,
		["Bold"] = { bold = true },
		["Italic"] = { italic = true },
		["Underlined"] = { underline = true },

		["Visual"] = groups.selection,

		["Directory"] = groups.brighter,

		["IncSearch"] = groups.selection,
		["Search"] = groups.selection,
		["Substitute"] = groups.selection,

        ["QuickFixLine"] = { bg = palette.background.brightest },

		["MatchParen"] = { fg = palette.foreground.brightest, bg = palette.background.brightest, bold = true },

		["ModeMsg"] = groups.brighter,
		["MoreMsg"] = groups.brighter,
		["NonText"] = { fg = palette.foreground.darkest },

		["LineNr"] = groups.dimmed,
		["LineNrAbove"] = groups.darkest,
		["LineNrBelow"] = groups.darkest,
		["CursorLineNr"] = groups.darker,

		["StatusLine"] = { fg = palette.foreground.medium, bg = palette.background.brighter },
		["StatusLineNC"] = { fg = palette.foreground.darkest, bg = palette.background.brighter },
		["WinSeparator"] = { fg = palette.foreground.darkest, bg = palette.background.medium },
		["SignColumn"] = groups.normal,
		["ColorColumn"] = { bg = palette.background.brighter },

		["TabLineFill"] = { bg = palette.background.brightest },
		["TabLine"] = { fg = palette.foreground.dimmed, bg = palette.background.brightest },
		["TabLineSel"] = { fg = palette.foreground.medium },

		["Pmenu"] = { fg = palette.foreground.medium, bg = palette.background.brightest },
		["PmenuSel"] = groups.selection,
		["PmenuSbar"] = { bg = palette.background.brightest },

		["Conceal"] = groups.darker,
		["Title"] = groups.brighter,
		["Question"] = groups.brighter,
		["SpecialKey"] = groups.darkest,
		["WildMenu"] = { fg = palette.foreground.medium, bg = palette.background.brightest },
		["Folded"] = { fg = palette.foreground.darker, bg = palette.background.brighter },
		["FoldColumn"] = { fg = palette.foreground.darkest, bg = palette.background.medium },

		["SpellBad"] = { underline = true },
		["SpellLocal"] = { underline = true },
		["SpellCap"] = { underline = true },
		["SpellRare"] = { underline = true },

		["Boolean"] = groups.brighter,
		["Character"] = groups.brighter,
		["Comment"] = groups.darker,
		["Conditional"] = groups.dimmed,
		["Constant"] = groups.brighter,
		["Define"] = groups.darker,
		["Delimiter"] = groups.darker,
		["Float"] = groups.brighter,
		["Function"] = groups.brighter,
		["Identifier"] = groups.medium,
		["Include"] = groups.darker,
		["Keyword"] = groups.dimmed_italic,
		["Label"] = groups.darker,
		["Number"] = groups.brighter,
		["Operator"] = groups.darker,
		["PreProc"] = groups.darker,
		["Repeat"] = groups.darker,
		["Special"] = groups.brighter,
		["SpecialChar"] = groups.brighter,
		["Statement"] = groups.medium,
		["StorageClass"] = groups.brighter,
		["String"] = groups.brighter_italic,
		["Structure"] = groups.brighter,
		["Tag"] = groups.medium,
		["Todo"] = groups.brightest,
		["Type"] = groups.brighter,
		["Typedef"] = groups.brighter,

		["@annotation"] = groups.darker_italic,
		["@attribute"] = groups.darker,
		["@boolean"] = groups.brighter,
		["@character"] = groups.brighter,
		["@character.special"] = groups.brighter,
		["@comment"] = groups.darker_italic,
		["@conditional"] = groups.medium,
		["@constant"] = groups.brighter,
		["@constant.builtin"] = groups.brighter,
		["@constant.macro"] = groups.darker,
		["@constructor"] = groups.brighter,
		["@debug"] = groups.medium,
		["@error"] = groups.brightest,
		["@exception"] = groups.brightest,
		["@field"] = groups.medium,
		["@float"] = groups.brighter,
		["@function"] = groups.brighter,
		["@function.builtin"] = groups.brighter,
		["@function.macro"] = groups.brighter,
		["@include"] = groups.darker,
		["@keyword"] = groups.dimmed_italic,
		["@keyword.function"] = groups.dimmed_italic,
		["@keyword.operator"] = groups.dimmed_italic,
		["@keyword.return"] = groups.dimmed_italic,
		["@label"] = groups.darker,
		["@method"] = groups.brighter,
		["@namespace"] = groups.darker,
		["@none"] = groups.darkest,
		["@number"] = groups.brighter,
		["@operator"] = groups.darker,
		["@parameter"] = groups.medium,
		["@parameter.reference"] = groups.darker,
		["@preproc"] = groups.darker,
		["@property"] = groups.medium,
		["@punctuation.delimiter"] = groups.darker,
		["@punctuation.bracket"] = groups.darker,
		["@punctuation.special"] = groups.darker,
		["@repeat"] = groups.darker,
		["@storageclass"] = groups.medium,
		["@string"] = groups.brighter_italic,
		["@string.regex"] = groups.brighter,
		["@string.escape"] = groups.medium,
		["@string.special"] = groups.medium,
		["@symbol"] = groups.brighter,
		["@tag"] = groups.medium,
		["@tag.attribute"] = groups.darker,
		["@tag.delimiter"] = groups.darker,
		["@text"] = groups.medium,
		["@text.strong"] = { bold = true },
		["@text.emphasis"] = { italic = true },
		["@text.underline"] = { underline = true },
		["@text.strike"] = { strikethrough = true },
		["@text.title"] = groups.brighter,
		["@text.literal"] = groups.brighter,
		["@text.uri"] = groups.medium_underline,
		["@text.math"] = groups.darker,
		["@text.reference"] = groups.darker,
		["@environment"] = groups.darker,
		["@environment.name"] = groups.darker,
		["@note"] = groups.medium,
		["@warning"] = groups.brighter,
		["@danger"] = groups.brightest,
		["@todo"] = groups.brightest,
		["@type"] = groups.medium,
		["@type.builtin"] = groups.medium,
		["@type.qualifier"] = groups.darker_italic,
		["@type.definition"] = groups.medium,
		["@variable"] = groups.medium,
		["@variable.builtin"] = groups.medium,

		["DiffAdd"] = { bg = palette.background.brighter },
		["DiffAdded"] = { fg = palette.foreground.medium },
		["DiffDelete"] = { fg = palette.background.brighter, bg = palette.background.brighter },
		["DiffRemoved"] = { fg = palette.foreground.darker },
		["DiffChange"] = { bg = palette.background.brighter },
		["DiffText"] = { fg = palette.background.medium, bg = palette.foreground.darker, bold = true },
		["DiffLine"] = { fg = palette.foreground.darker },

		["TelescopeSelectionCaret"] = { bg = palette.background.brightest },
		["TelescopeSelection"] = { bg = palette.background.brightest },
		["TelescopeMatching"] = groups.brightest_bold,

		["netrwMarkFile"] = { bg = palette.background.brightest },
	}

	for group, spec in pairs(highlight_groups) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

return M
