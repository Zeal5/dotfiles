return {
    "christoomey/vim-tmux-navigator",
	  event = "VeryLazy",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    -- config = function()
    --     local nvim_tmux_nav = require("vim-tmux-navigator")
    --     nvim_tmux_nav.setup({
    --         keybindings = {
    --             left = "<C-h>",
    --             down = "<C-j>",
    --             up = "<C-k>",
    --             right = "<C-l>",
    --             last_active = "<C-\\>",
    --         },
    --     })
    -- end,
}
