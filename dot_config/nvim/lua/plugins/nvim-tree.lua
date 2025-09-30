local my_on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    api.config.mappings.default_on_attach(bufnr)
			vim.keymap.del("n", "<2-LeftMouse>", { buffer = bufnr })
			vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
			-- vim.keymap.set('n', '<C-h>', api.tree.focus)
end

return{
-- OR setup with some options
	"nvim-tree/nvim-tree.lua",
	dependencies = {
	  'nvim-tree/nvim-web-devicons',
	},


	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = true,
			hijack_cursor = true,
			sync_root_with_cwd = true,
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			renderer = {
			--	highlight_opened_files = "all",
				highlight_git = true,
				indent_markers = {
					enable = true,
				},
			},
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = {},
			},
			view = {
				width = 35,
				side = "left",
				number = false,
				relativenumber = false,
			},
			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			filters = {
				dotfiles = false,
			},
		})
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "open nvim tree" })
	end,
}

