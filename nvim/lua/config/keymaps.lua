MAP = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

MAP('i', '<C-H>', '<C-w>')
MAP('i', 'C-BS', "<C-w>", {noremap = true})
MAP('n','s', '', {noremap = true})
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
-- MAP('n', '<C-t>', ':terminal<CR>')
-- -- next tab
MAP('n', '<Tab>', 'gt')
-- -- previous tab
MAP('n', '<S-Tab>', 'gT')
-- Close the current tab/buffer:
MAP('n', '<leader>q', ':bd!<CR>')

-- S&R -> takes current word
MAP('n', '<leader>ra', [[:%s/<C-r><C-w>//gc<Left><Left><Left>]])

-- MAP('n', '<S-A-f>', '<cmd>!black %<cr>')

-- Increase / Decrease Split Window size 
MAP('n', '<C-Left>', ':vertical resize -1<CR>')
MAP('n', '<C-Right>', ':vertical resize +1<CR>')
MAP('n', '<C-Up>', ':resize -1<CR>')
MAP('n', '<C-Down>', ':resize +1<CR>')

-- Define a function to format the current buffer using black or rustfmt
function FormatCode()
    local file_type = vim.bo.filetype
		if file_type == "rust" then
			vim.api.nvim_command("silent !rustfmt %" )
			print("Formatted Rust code.")
		elseif file_type == "python" then
				vim.api.nvim_command("silent !black %" )
				print("Formatted Python code.")
		elseif  file_type == "javascript" or file_type == "svelte" or file_type == "html" then
				vim.api.nvim_command("silent !prettier % --write" )
				print("File formated sucessfully")
		else
				print("Unsupported file type for formatting.")
		end
end

-- Set up the key mapping with autocmd for FileType
vim.cmd[[
augroup CodeFormat
    autocmd!
    autocmd FileType * noremap <buffer> <S-A-f> :lua FormatCode()<CR>
augroup END
]]
