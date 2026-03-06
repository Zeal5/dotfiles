-- ~/.config/nvim/lua/plugins/alpha.lua
return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		-- dashboard.section.header.val = {
		--   "  _   _                 _   _           ",
		--   " | \\ | | ___  _ __ ___ | |_| |__   ___  ",
		--   " |  \\| |/ _ \\| '_ ` _ \\| __| '_ \\ / _ \\ ",
		--   " | |\\  | (_) | | | | | | |_| | | |  __/ ",
		--   " |_| \\_|\\___/|_| |_| |_|\\__|_| |_|\\___| ",
		-- }

		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
			dashboard.button("m", "  Marks", ":Telescope marks<CR>"),
		}

		dashboard.section.footer.val = "Have a productive day! 🌞"

		alpha.setup(dashboard.opts)
		-- vim.api.nvim_set_hl(1, "AlphaHeader", { fg = "#ff5f5f", bold = true })
		-- vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#5fd7ff" })
		-- vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#a0a0a0", italic = true })
	end,
}
