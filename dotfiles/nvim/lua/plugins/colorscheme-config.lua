-- Material theme
-- local colors = require 'material.colors'
-- require('material').setup({
--   contrast = {
--     terminal = false,          -- Enable contrast for the built-in terminal
--     sidebars = true,           -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--     floating_windows = true,   -- Enable contrast for floating windows
--     cursor_line = false,       -- Enable darker background for the cursor line
--     non_current_windows = true, -- Enable darker background for non-current windows
--     filetypes = {},            -- Specify which filetypes get the contrasted (darker) background
--   },
--   styles = {                   -- Give comments style such as bold, italic, underline etc.
--     comments = { italic = true },
--     strings = { --[[ bold = true ]] },
--     keywords = { --[[ underline = true ]] },
--     functions = { --[[ bold = true, undercurl = true ]] },
--     variables = {},
--     operators = {},
--     types = {},
--   },
--   plugins = { -- Uncomment the plugins that you use to highlight them
--     "dap",
--     "gitsigns",
--     -- "indent-blankline",
--     "nvim-cmp",
--     -- "nvim-navic",
--     "nvim-tree",
--     "nvim-web-devicons",
--     "sneak",
--     "telescope",
--     -- "which-key",
--   },
--   lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
--   async_loading = true,     -- Load parts of the theme asyncronously for faster startup (turned on by default)
--   --custom_colors = nil, -- If you want to everride the default colors, set this to a function
--   custom_highlights = {
--     Todo             = { fg = "#FFFF00"},
--     CursorLine       = { fg = colors.editor.constrast, underline = true },
--     GitSignsAdd      = { fg = colors.git.added },
--     GitSignsChange   = { fg = colors.git.modified },
--     GitSignsDelete   = { fg = colors.git.removed },
--     GitSignsAddNr    = { fg = colors.git.added },
--     GitSignsAddLn    = { fg = colors.git.added },
--     GitSignsChangeNr = { fg = colors.git.modified, },
--     GitSignsChangeLn = { fg = colors.git.modified },
--     GitSignsDeleteNr = { fg = colors.git.removed, },
--     GitSignsDeleteLn = { fg = colors.git.removed },
--   },
-- })
-- vim.g.material_style = "deep ocean"
-- vim.cmd("colorscheme material")

-- Default Theme:
require('kanagawa').setup({
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
  overrides = function(colors)
    local theme = colors.theme
    return {
      LineNr           = { bg = "#161616" },
      FoldColumn       = { bg = "#161616" },
      SignColumn       = { bg = "#161616" },
      CursorLine       = { bg = "#1c1c1c" },
      VertSplit        = { bg = "#161616" },
      Normal           = { bg = "#161616" },
      Todo             = { bg = "#ffA500" },
      CursorLineSign   = { bg = "#161616" },
      CursorLineFold   = { bg = "#161616" },
      NormalNC         = { bg = "#161616" },

      GitSignsAdd      = { bg = "none" },
      GitSignsChange   = { bg = "none" },
      GitSignsDelete   = { bg = "none" },
      GitSignsAddNr    = { bg = "none" },
      GitSignsAddLn    = { bg = "none" },
      GitSignsChangeNr = { bg = "none" },
      GitSignsChangeLn = { bg = "none" },
      GitSignsDeleteNr = { bg = "none" },
      GitSignsDeleteLn = { bg = "none" },
    }
  end,
  theme = "dragon",  -- Load "dragon" theme when 'background' option is not set
  background = {     -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus"
  },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
