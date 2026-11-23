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
		["CurSearch"] = groups.selection,
		["Substitute"] = groups.selection,

		["QuickFixLine"] = { bg = palette.background.brightest },

		["MatchParen"] = { fg = palette.foreground.brightest, bg = palette.background.brightest, bold = true },

		["ModeMsg"] = groups.brighter,
		["MoreMsg"] = groups.brighter,
		["NonText"] = { fg = palette.foreground.darkest },
		["Whitespace"] = groups.darkest,
		["EndOfBuffer"] = groups.darkest,

		["LineNr"] = groups.dimmed,
		["LineNrAbove"] = groups.darkest,
		["LineNrBelow"] = groups.darkest,
		["CursorLineNr"] = groups.darker,
		["CursorLine"] = { bg = palette.background.brighter },
		["CursorColumn"] = { bg = palette.background.brighter },

		["StatusLine"] = { fg = palette.foreground.medium, bg = palette.background.brighter },
		["StatusLineNC"] = { fg = palette.foreground.darkest, bg = palette.background.brighter },
		["WinBar"] = { fg = palette.foreground.medium },
		["WinBarNC"] = { fg = palette.foreground.darkest },
		["WinSeparator"] = { fg = palette.foreground.darkest, bg = palette.background.medium },
		["SignColumn"] = groups.normal,
		["ColorColumn"] = { bg = palette.background.brighter },

		["TabLineFill"] = { bg = palette.background.brightest },
		["TabLine"] = { fg = palette.foreground.dimmed, bg = palette.background.brightest },
		["TabLineSel"] = { fg = palette.foreground.medium },

		["Pmenu"] = { fg = palette.foreground.medium, bg = palette.background.brightest },
		["PmenuSel"] = groups.selection,
		["PmenuKind"] = { fg = palette.foreground.dimmed, bg = palette.background.brightest },
		["PmenuExtra"] = { fg = palette.foreground.darker, bg = palette.background.brightest },
		["PmenuMatch"] = { fg = palette.foreground.brightest, bg = palette.background.brightest, bold = true },
		["PmenuMatchSel"] = { fg = palette.selection.foreground, bg = palette.selection.background, bold = true },
		["PmenuSbar"] = { bg = palette.background.brightest },
		["PmenuThumb"] = { bg = palette.foreground.darkest },

		["NormalFloat"] = { fg = palette.foreground.medium, bg = palette.background.brighter },
		["FloatBorder"] = { fg = palette.foreground.darkest, bg = palette.background.brighter },
		["FloatTitle"] = { fg = palette.foreground.brighter, bg = palette.background.brighter },
		["FloatFooter"] = { fg = palette.foreground.darker, bg = palette.background.brighter },

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

		["Added"] = groups.medium,
		["Changed"] = groups.dimmed,
		["Removed"] = groups.darker,

		["@attribute"] = groups.darker,
		["@boolean"] = groups.brighter,
		["@character"] = groups.brighter,
		["@character.special"] = groups.brighter,
		["@comment"] = groups.darker_italic,
		["@comment.documentation"] = groups.darker_italic,
		["@comment.note"] = groups.medium,
		["@comment.warning"] = groups.brighter,
		["@comment.error"] = groups.brightest,
		["@comment.todo"] = groups.brightest,
		["@constant"] = groups.brighter,
		["@constant.builtin"] = groups.brighter,
		["@constant.macro"] = groups.darker,
		["@constructor"] = groups.brighter,
		["@diff.plus"] = groups.medium,
		["@diff.minus"] = groups.darker,
		["@diff.delta"] = groups.dimmed,
		["@function"] = groups.brighter,
		["@function.builtin"] = groups.brighter,
		["@function.macro"] = groups.brighter,
		["@function.method"] = groups.brighter,
		["@function.method.call"] = groups.brighter,
		["@keyword"] = groups.dimmed_italic,
		["@keyword.conditional"] = groups.medium,
		["@keyword.directive"] = groups.darker,
		["@keyword.directive.define"] = groups.darker,
		["@keyword.exception"] = groups.brightest,
		["@keyword.function"] = groups.dimmed_italic,
		["@keyword.import"] = groups.darker,
		["@keyword.modifier"] = groups.medium,
		["@keyword.operator"] = groups.dimmed_italic,
		["@keyword.repeat"] = groups.darker,
		["@keyword.return"] = groups.dimmed_italic,
		["@label"] = groups.darker,
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.heading"] = groups.brighter,
		["@markup.raw"] = groups.brighter,
		["@markup.link"] = groups.darker,
		["@markup.link.url"] = groups.medium_underline,
		["@markup.list"] = groups.darker,
		["@markup.math"] = groups.darker,
		["@module"] = groups.darker,
		["@number"] = groups.brighter,
		["@number.float"] = groups.brighter,
		["@operator"] = groups.darker,
		["@property"] = groups.medium,
		["@punctuation.delimiter"] = groups.darker,
		["@punctuation.bracket"] = groups.darker,
		["@punctuation.special"] = groups.darker,
		["@string"] = groups.brighter_italic,
		["@string.documentation"] = groups.brighter_italic,
		["@string.escape"] = groups.medium,
		["@string.regexp"] = groups.brighter,
		["@string.special"] = groups.medium,
		["@string.special.symbol"] = groups.brighter,
		["@tag"] = groups.medium,
		["@tag.builtin"] = groups.medium,
		["@tag.attribute"] = groups.darker,
		["@tag.delimiter"] = groups.darker,
		["@type"] = groups.medium,
		["@type.builtin"] = groups.medium,
		["@type.definition"] = groups.medium,
		["@variable"] = groups.medium,
		["@variable.builtin"] = groups.medium,
		["@variable.member"] = groups.medium,
		["@variable.parameter"] = groups.medium,

		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.macro"] = { link = "@function.macro" },
		["@lsp.type.method"] = { link = "@function.method" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.variable"] = { link = "@variable" },

		["LspReferenceText"] = { bg = palette.background.brightest },
		["LspReferenceRead"] = { bg = palette.background.brightest },
		["LspReferenceWrite"] = { bg = palette.background.brightest },
		["LspInlayHint"] = { fg = palette.foreground.darker, bg = palette.background.brighter },
		["LspCodeLens"] = groups.darker,
		["LspSignatureActiveParameter"] = { fg = palette.foreground.brightest, bold = true },

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

	local terminal_colors = {
		colors.raisin_black,
		colors.gray,
		colors.quick_silver,
		colors.chinese_silver,
		colors.gray,
		colors.quick_silver,
		colors.chinese_silver,
		colors.chinese_silver,
		colors.dark_charcoal,
		colors.gray,
		colors.quick_silver,
		colors.chinese_silver,
		colors.gray,
		colors.quick_silver,
		colors.chinese_silver,
		colors.white,
	}

	for i, color in ipairs(terminal_colors) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end

	vim.g.colors_name = "coal"
end

return M
