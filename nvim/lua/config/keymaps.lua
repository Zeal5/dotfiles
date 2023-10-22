map = vim.keymap.set

vim.g.mapleader = " " 
vim.g.maplocalleader = " "

map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("i", "jj", "<ESC>", { desc = "Switch to normal mode" })

