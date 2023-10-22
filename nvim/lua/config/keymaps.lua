map = vim.keymap.set

vim.g.mapleader = " " 
vim.g.maplocalleader = " "

map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("i", "jj", "<ESC>", { desc = "Switch to normal mode" })

-- copy to system clipboard
map("v", "<leader>cp", [["+y]], { desc = "copy selected text" })
map("n", "<leader>cp", [["+Y]], { desc = "copy line" })

-- paste from system clipboard
map({ "n", "v" }, "<leader>cv", [["+p]])







