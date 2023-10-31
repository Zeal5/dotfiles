MAP = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

MAP("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })
MAP("i", "jj", "<ESC>", { desc = "Switch to noMAPal mode" })

-- copy to system clipboard
MAP("v", "<leader>cp", [["+y]], { desc = "copy selected text" })
MAP("n", "<leader>cp", [["+Y]], { desc = "copy line" })

-- paste from system clipboard
MAP({ "n", "v" }, "<leader>cv", [["+p]])

-- search undo
MAP("n", "<leader>h", "<cmd>nohlsearch<CR>")

-- save file quit nvim
MAP("n", "<C-s>", "<cmd>w<CR>")
MAP("n", "<C-q>", "<cmd>q!<CR>")

-- slplit window vertical and horizantly 
MAP('n', '<leader>+', ':vsplit<CR>')
MAP('n', '<leader>-', ':split<CR>')

-- move bewteen tabs using arrow keys
MAP('n', '<C-h>', ':wincmd h<CR>')
MAP('n', '<C-j>', ':wincmd j<CR>')
MAP('n', '<C-k>', ':wincmd k<CR>')
MAP('n', '<C-l>', ':wincmd l<CR>')

-- Indent selected text with Tab
MAP('v', '<Tab>', '>gv')
-- Unindent selected text with Shift+Tab
MAP('v', '<S-Tab>', '<gv')

-- search centering
MAP('n', 'n', 'nzz')
MAP('n', 'N', 'Nzz')

-- TABS/BUFFERS:
-- Map Ctrl+t to open a new tab:
MAP('n', '<C-t>', ':tabnew<CR>')
-- -- next tab
MAP('n', '<Tab>', 'gt')
-- -- previous tab
MAP('n', '<S-Tab>', 'gT')
-- Close the current tab/buffer:
MAP('n', '<leader>q', ':bd!<CR>')

-- S&R -> takes current word
MAP('n', '<leader>ra', [[:%s/<C-r><C-w>//gc<Left><Left><Left>]])

MAP('n', '<S-A-f>', '<cmd>!black %<cr>')
