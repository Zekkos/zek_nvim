local opts = { noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Leader>c", ":lua require('neogen').generate()<CR>", opts)
