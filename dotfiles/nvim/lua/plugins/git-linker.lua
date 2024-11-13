return {
  "linrongbin16/gitlinker.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "GitLink",
  lazy = false,
  opts = {},
  keys = {
    { "<leader>gy", "<cmd>GitLink<cr>",  mode = { "n", "v" }, desc = "Yank git link" },
    { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    {
      "<leader>gdy",
      "<cmd>GitLink default_branch<cr>",
      mode = { "n", "v" },
      desc = "Yank git link for default branch",
    },
  },
}
