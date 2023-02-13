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
    --LineNr           = { bg = '#FF0000' },
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
vim.cmd 'colorscheme material'
