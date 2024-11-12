return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {},
    config = function(_, opts)
      require("gitsigns").setup(opts)
      vim.keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>")
      vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
      vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>")
    end,
  },
}
