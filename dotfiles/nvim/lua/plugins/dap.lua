-- Mappings
vim.keymap.set("n", "<leader>do", function() return require 'dapui'.open() end)
vim.keymap.set("n", "<leader>de", function() return require 'dapui'.close() end)
vim.keymap.set("n", "<leader>dc", function() return require 'dap'.continue() end)
vim.keymap.set("n", "<leader>dn", function() return require 'dap'.step_over() end)
vim.keymap.set("n", "<leader>db", function() return require 'dap'.toggle_breakpoint() end)

return {
  {
    "nvim-neotest/nvim-nio",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- this closes the DAP ui once it's done executing. commented out
      --   dap.listeners.before.event_terminated["dapui_config"] = function()
      --     dapui.close()
      --   end
      --   dap.listeners.before.event_exited["dapui_config"] = function()
      --     dapui.close()
      --   end
    end,
  },
  -- nvim-dap-ui requires nvim-nio to be installed. Install from https://github.com/nvim-neotest/nvim-nio
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      -- require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },
}
