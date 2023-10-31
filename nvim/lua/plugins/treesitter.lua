return {
  "nvim-treesitter/nvim-treesitter",

	config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true, additional_vim_regex_highlight = true, },
			ensure_installed = {"python", "lua" },
			indent = { enable = true},
    })
  end
}
