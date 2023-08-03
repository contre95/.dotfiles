local colors = require 'material.colors'
require('material').setup({
 contrast = {
   terminal = false, -- Enable contrast for the built-in terminal
   sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
   floating_windows = true, -- Enable contrast for floating windows
   cursor_line = false, -- Enable darker background for the cursor line
   non_current_windows = true, -- Enable darker background for non-current windows
   filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
 },
 styles = { -- Give comments style such as bold, italic, underline etc.
   comments = {  italic = true },
   strings = { --[[ bold = true ]] },
   keywords = { --[[ underline = true ]] },
   functions = { --[[ bold = true, undercurl = true ]] },
   variables = {},
   operators = {},
   types = {},
 },
 plugins = { -- Uncomment the plugins that you use to highlight them
   -- Available plugins:
   "dap",
   -- "dashboard",
   "gitsigns",
   -- "hop",
   -- "indent-blankline",
   -- "lspsaga",
   -- "mini",
   -- "neogit",
   "nvim-cmp",
   -- "nvim-navic",
   "nvim-tree",
   "nvim-web-devicons",
   --"sneak",
   "telescope",
   -- "trouble",
   -- "which-key",
 },
 lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
 async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
 --custom_colors = nil, -- If you want to everride the default colors, set this to a function
 custom_highlights = {
   -- LineNr           = { bg = '#FF0000' },
   CursorLine       = { fg = colors.editor.constrast, underline = true },
   GitSignsAdd      = { fg = colors.git.added },
   GitSignsChange   = { fg = colors.git.modified },
   GitSignsDelete   = { fg = colors.git.removed },
   GitSignsAddNr    = { fg = colors.git.added },
   GitSignsAddLn    = { fg = colors.git.added },
   GitSignsChangeNr = { fg = colors.git.modified, },
   GitSignsChangeLn = { fg = colors.git.modified },
   GitSignsDeleteNr = { fg = colors.git.removed, },
   GitSignsDeleteLn = { fg = colors.git.removed },
 },
})
vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")

----------------------------------------------
require('kanagawa').setup({
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {
    -- palette = {
    --   -- dragonBlack4 = "#181616"
    --   dragonBlack4 = "none"
    -- },
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
  overrides = function(colors)
    local theme = colors.theme
    local mcolors = require 'material.colors'
    return {
      -- CursorLine             = { fg = mcolors.editor.constrast, underline = true },
      -- GitSignsAdd            = { fg = mcolors.git.added },
      -- GitSignsChange         = { fg = mcolors.git.modified },
      -- GitSignsDelete         = { fg = mcolors.git.removed },
      -- GitSignsAddNr          = { fg = mcolors.git.added },
      -- GitSignsAddLn          = { fg = mcolors.git.added },
      -- GitSignsChangeNr       = { fg = mcolors.git.modified, },
      -- GitSignsChangeLn       = { fg = mcolors.git.modified },
      -- GitSignsDeleteNr       = { fg = mcolors.git.removed, },
      -- GitSignsDeleteLn       = { fg = mcolors.git.removed },
      TelescopeTitle         = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal  = { bg = theme.ui.bg_p1 },
      -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      -- Pmenu                  = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
      -- PmenuSel               = { fg = "NONE", bg = theme.ui.bg_p2 },
      -- PmenuSbar              = { bg = theme.ui.bg_m1 },
      -- PmenuThumb             = { bg = theme.ui.bg_p2 },
    }
  end,
  theme = "lotus", -- Load "wave" theme when 'background' option is not set
  background = {
    -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus"
  },
})
-- vim.cmd("colorscheme kanagawa-dragon")
----------------------------------------------
-- require('colorizer').setup()

-- ----------------------------------------------
-- vim.cmd [[colorscheme rasmus]]
