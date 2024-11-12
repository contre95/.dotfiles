return {
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    lazy = true,
    event = "VeryLazy",
    cmd = "WhichKey",
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.add({
        { "<leader>F", group = "Find" },
      }
      )
    end,
  },
}
