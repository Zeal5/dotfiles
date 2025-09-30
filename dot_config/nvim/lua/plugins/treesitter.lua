return {
  "nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true, additional_vim_regex_highlight = true, },
			ensure_installed = {"c","vim","vimdoc", "query", "python", "lua", 'rust', 'tsx', 'typescript', "svelte", "javascript", "solidity", "html",  "css","go" },
			auto_install = true ,
			indent = { enable = true},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
		})
	end

}
