return {
  {
    "olexsmir/gopher.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    config = function()
      require("gopher").setup()
      local wk = require("which-key")
      wk.add({
        { "<leader>ga",  group = "Add" },
        { "<leader>gai", "<cmd>GoIfErr<CR>",       desc = "Add if != err statement" },
        { "<leader>gs",  group = "Struct Tags" },
        { "<leader>gsj", "<cmd>GoTagAdd json<CR>", desc = "Add json struct tags" },
        { "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", desc = "Add yaml struct tags" },
      })
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
