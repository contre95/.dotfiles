require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
require("CopilotChat").setup {
  debug = false, -- Enable debugging
  show_help = false,
  -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
  model = 'gpt-4o', -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
  temperature = 0.1, -- GPT temperature
}
