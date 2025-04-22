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

-- vim.keymap.set("n", "<C-n>", function() return require('material.functions').toggle_style() end)
-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     dependencies = {
--       { 'marko-cerovac/material.nvim' }, -- Not a real dependency
--     },
--     lazy = false,
--     opts = {
--       compile = false,  -- enable compiling the colorscheme
--       undercurl = true, -- enable undercurls
--       commentStyle = { italic = true },
--       functionStyle = {},
--       keywordStyle = { italic = true },
--       statementStyle = { bold = true },
--       typeStyle = {},
--       transparent = false,   -- do not set background color
--       dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--       colors = {             -- add/modify theme and palette colors
--         palette = {},
--         theme = { dragon = {}, lotus = {}, wave = {}, all = {} },
--       },
--       overrides = function()
--         return {
--           LineNr           = { bg = "#161616" },
--           FoldColumn       = { bg = "#161616" },
--           SignColumn       = { bg = "#161616" },
--           CursorLine       = { bg = "#1c1c1c" },
--           VertSplit        = { bg = "#161616" },
--           Normal           = { bg = "#161616" },
--           Todo             = { bg = "#ffA500" },
--           CursorLineSign   = { bg = "#161616" },
--           Pmenu   = { bg = "#161616" },
--           CursorLineFold   = { bg = "#161616" },
--           CodewindowBorder = { fg = "#1c1c1c" },
--           NormalNC         = { bg = "#161616" },
--
--           GitSignsAdd      = { bg = "none" },
--           GitSignsChange   = { bg = "none" },
--           GitSignsDelete   = { bg = "none" },
--           GitSignsAddNr    = { bg = "none" },
--           GitSignsAddLn    = { bg = "none" },
--           GitSignsChangeNr = { bg = "none" },
--           GitSignsChangeLn = { bg = "none" },
--           GitSignsDeleteNr = { bg = "none" },
--           GitSignsDeleteLn = { bg = "none" },
--         }
--       end,
--       theme = "dragon",  -- Load "dragon" theme when 'background' option is not set
--       background = {     -- map the value of 'background' option to a theme
--         dark = "dragon", -- try "dragon" !
--         light = "lotus"
--       },
--     }
--   }
-- }
