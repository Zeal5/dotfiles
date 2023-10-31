-- enable numbers
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.o.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.o.tabstop = 2                             -- insert 2 spaces for a tab

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
