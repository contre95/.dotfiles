return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      compile = false,  -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,   -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = { dragon = {}, lotus = {}, wave = {}, all = {} },
      },
      overrides = function()
        return {
        LineNr           = { bg = "none" },
        FoldColumn       = { bg = "none" },
        SignColumn       = { bg = "none" },
        CursorLine       = { bg = "none" },
        VertSplit        = { bg = "none" },
        Normal           = { bg = "none" },
        NormalNC         = { bg = "none" },
        NormalFloat      = { bg = "none" },
        CursorLineNR     = { bg = "none" },
        CursorLineFold   = { bg = "none" },
        CursorLineSign   = { bg = "none" },
        Todo             = { bg = "#ffA500" },
        CodewindowBorder = { fg = "#1c1c1c" },

        -- GitSignsAdd      = { bg = "none" },
        -- GitSignsChange   = { bg = "none" },
        -- GitSignsDelete   = { bg = "none" },
        -- GitSignsAddNr    = { bg = "none" },
        -- GitSignsAddLn    = { bg = "none" },
        -- GitSignsChangeNr = { bg = "none" },
        -- GitSignsChangeLn = { bg = "none" },
        -- GitSignsDeleteNr = { bg = "none" },
        -- GitSignsDeleteLn = { bg = "none" },
      }
      end,
      theme = "dragon",  -- Load "dragon" theme when 'background' option is not set
      background = {     -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus"
      },
    }
  }
}
