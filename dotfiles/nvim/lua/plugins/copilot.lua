return {
  {
    "zbirenbaum/copilot-cmp",
    -- dependencies = {
    --   {
    --     "zbirenbaum/copilot.lua",
    --     config = require("copilot").setup({
    --       suggestion = { enabled = false },
    --       panel = { enabled = false },
    --     })
    --   }
    -- },
    config = function()
      require("copilot_cmp").setup({
        fix_pairs = false,
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    build = "make tiktoken",        -- Only on MacOS or Linux
    opts = {
      debug = false,                -- Enable debugging
      show_help = false,
      -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
      model = 'gpt-4o',  -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
      temperature = 0.1, -- GPT temperature
    }
    -- See Commands section for default commands if you want to lazy load on them
  },
}