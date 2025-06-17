require("zekkos.packer")
require("zekkos.remap")
print("Hello from the Zek")


vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.wo.number = true
vim.wo.relativenumber = true

-- Configuring nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrmPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()

