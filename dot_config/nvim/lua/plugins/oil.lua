return {
  "stevearc/oil.nvim",
  keys = {
     { "<leader>e", "<cmd>Oil --float<CR>", desc = "Explorer" },
  },
  opts = {
    view_options = { show_hidden = true },
    float = { padding = 5 },
    default_file_explorer = true,

  dependencies = { "nvim-tree/nvim-web-devicons" },
	keymaps = {
    ["h"] = "actions.parent",      -- go to parent directory
    ["l"] = "actions.select",      -- cd into selected directory / open file
    ["<CR>"] = "actions.select",   -- optional: also Enter to open
    ["q"] = "actions.close",       -- close oil buffer
	}
  },
}
