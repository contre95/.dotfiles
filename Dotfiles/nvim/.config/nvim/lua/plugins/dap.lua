require('dapui').setup({
  icons = { expanded = "", collapsed = "ﬔ", current_frame = "" },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "ﰌ",
      terminate = "",
    },
  },
})
require('dap-go').setup({})
