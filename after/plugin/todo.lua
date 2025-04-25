require("todo").setup({
  default_file_extension = ".txt"
})


local opts = { noremap = true, silent = true, nowait = true}
vim.api.nvim_set_keymap("n", "<Leader>t", ":TodoOpen global_todo.txt", opts)
