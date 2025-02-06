vim.keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>")
vim.keymap.set("v", "ga", ":Gitsigns stage_hunk<CR>")

return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    opts = {},
  },
}
