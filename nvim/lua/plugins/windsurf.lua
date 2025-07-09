return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			virtual_text = {
				enabled = true,
				filetypes = {
					python = true,
					markdown = false,
					html = false,
				},
				default_filetype_enabled = true,
			},
		})
	end,
}
