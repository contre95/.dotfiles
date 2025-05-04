return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      theme = "immortal",
      -- Can be one of: 'light' | 'dark', or set via vim.o.background
      variant = "dark",
      diagnostics = {
        darker = true, -- Darker colors for diagnostic
        undercurl = true, -- Use undercurl for diagnostics
        background = true, -- Use background color for virtual text
      },
      -- The following table accepts values the same as the `gui` option for normal
      -- highlights. For example, `bold`, `italic`, `underline`, `none`.
      code_style = {
        comments = "italic",
        conditionals = "none",
        functions = "none",
        keywords = "none",
        headings = "bold", -- Markdown headings
        operators = "none",
        keyword_return = "none",
        strings = "none",
        variables = "none",
      },
      plugin = {
        lualine = {
          -- Bold lualine_a sections
          bold = true,
          -- Don't set section/component backgrounds. Recommended to not set
          -- section/component separators.
          plain = false,
        },
        cmp = { -- works for nvim.cmp and blink.nvim
          -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
          plain = false,
          -- Reverse lsp-kind items' highlights in blink/cmp menu.
          reverse = false,
        },
      },
    })
  end,
}

