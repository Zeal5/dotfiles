return{
	"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
		event = { "BufReadPost", "BufNewFile" },
	config = function()
	local highlight = {
		"RainbowComment",
		-- "RainbowCyan",
  --   "RainbowViolet",
  --   "RainbowGreen",
  --   "RainbowRed",
  --   "RainbowBlue",
  --   "RainbowYellow",
  --   "RainbowOrange",
  }

	local hooks = require "ibl.hooks"
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- #796a86
			vim.api.nvim_set_hl(0, "RainbowComment", { fg = "#866a81" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	end)
		-- Scope is not the current indentation level instead it is the indentation level where variables and functions are accessible
		require('ibl').setup({
			indent = { highlight = highlight, char = "│",smart_indent_cap = true, priority = 1};
			whitespace = { remove_blankline_trail = false, highlight = { "whitespace", "NonText" }, },
			scope = { char = "╎", show_start = true, show_exact_scope = true, highlight = highlight,show_end = true, }
		})
	end

}

