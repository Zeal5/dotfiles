return {
	"EdenEast/nightfox.nvim",

	config = function()
		-- Default options
		require('nightfox').setup({
			options = {
				styles = {               -- Style to be applied to different syntax groups
					comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
					conditionals = "NONE",
					constants = "NONE",
					functions = "NONE",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "NONE",
					variables = "NONE",
				},
			},
			groups = {
				-- As with specs and palettes, the values defined under `all` will be applied to every style.
				all = {
					-- If `link` is defined it will be applied over any other values defined
					Whitespace = { link = "Comment" },
					-- Specs are used for the template. Specs have their palette's as a field that can be accessed
					IncSearch = { bg = "palette.cyan" },
					-- As with specs and palettes, a specific style's value will be used over the `all`'s value.
					PmenuSel = { bg = "#73daca", fg = "bg0" },
					String = {fg = "#a3a2a2" },
					Constant = {fg = "#7a7dff" },
					Variable = { fg = "#ff00ff" },
					 -- ["@variable"] = { fg = "#ff00ff" },    -- Treesitter semantic variable
      -- ["@variable.python"] = { fg = "#ff00ff" }, -- Python-specific variable


					Identifier = {fg = "#e31e2e" },
					Function = {fg = "#c2bf69"},
					-- Statement = {fg = "#f50a0a"},
					-- Keyword = {fg = "#f50a0a"},
					Exception = {fg = "#ffef0f"},
					conditionals = {fg = "#faa2ee" },
				},
			},
		})
		-- setup must be called before loading
		vim.cmd('colorscheme carbonfox')
	end
}
--[[ 
	 Repeat		for, do, while, etc.
	 Label		case, default, etc.
	 Operator	"sizeof", "+", "*", etc.
	 Exception	try, catch, throw

	*PreProc	generic Preprocessor
	 Include	preprocessor #include
	 Define		preprocessor #define
	 Macro		same as Define
	 PreCondit	preprocessor #if, #else, #endif, etc.

	*Type		int, long, char, etc.
	 StorageClass	static, register, volatile, etc.
	 Structure	struct, union, enum, etc.
	 Typedef	A typedef

	*Special	any special symbol
	 SpecialChar	special character in a constant
	 Tag		you can use CTRL-] on this
	 Delimiter	character that needs attention
	 SpecialComment	special things inside a comment
	 Debug		debugging statements

	*Underlined	text that stands out, HTML links

	*Ignore		left blank, hidden  |hl-Ignore|

	*Error		any erroneous construct

	*Todo		anything that needs extra attention; mostly the
			keywords TODO FIXME and XXX
]]
