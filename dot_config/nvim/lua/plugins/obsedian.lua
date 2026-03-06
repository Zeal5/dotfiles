return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	ft = "markdown",
	-- @module 'obsidian'
	-- @type obsidian.config
	opts = {
		ui = {
			enable = false,
		},
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "personal",
				path = "~/obsedian_vaults/test/",
			},
			{
				name = "fedora",
				path = "~/obsedian_vaults/fedora/",
			},
		},
	},
}
