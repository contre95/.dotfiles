-- Telescope
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>e", ":Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>c", ":Telescope lsp_incoming_calls <cr>")
vim.keymap.set("n", "<leader>o", ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>")

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
