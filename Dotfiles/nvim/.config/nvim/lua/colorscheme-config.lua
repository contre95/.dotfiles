local colors = require("material/colors")
require("material").setup({

    --contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
    contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        line_numbers = false, -- Enable contrast background for line numbers
        sign_column = false, -- Enable contrast background for the sign column
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        popup_menu = true, -- Enable lighter background for the popup menu
    },

    --borders = true, -- Enable borders between vertically split windows

    popup_menu = "light", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

    italics = {
        comments = true, -- Enable italic comments
    },

    contrast_windows = { -- Specify which windows get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf", -- Darker qf list background
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true, -- Enable higher contrast text for darker style
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between vertically split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines =  true -- Hide the end-of-buffer lines
    },

    lualine_style = "default",

    custom_highlights = {

       --NormalFloat = { bg = '#1f252e', fg = colors.white}, 
       FloatBorder  = { bg = colors.none, fg = colors.white},
       Visual = { bg = "#6a798a", fg = colors.white},

       --- Common
       --Identifier = { fg = colors.cyan },
       --Directory = { fg = colors.white},
       Todo = { fg = colors.yellow},
       SpellBad = { fg = "#A46767", bg = "#533D3D"},
       --DiffAdd = { bg = "#45493e", fg = colors.none },
       --DiffChange = { bg = "#384851", fg = colors.none },
       --DiffDelete = { bg = colors.none, fg = colors.selection },
       --DiffText = { bg = "#5b7881", fg = colors.none },
       --MatchParen = { fg = colors.comments, bg = colors.cyan },
       --Search = { fg = colors.white, bg = colors.comments },
       --IncSearch = { fg = colors.white, bg = colors.comments },
       --StatusLine = { fg = colors.comments, bg = colors.bg },
       --StatusLineNC = { fg = colors.selection, bg = colors.bg },

       -- LSP
       LspReferenceText = { fg = colors.none, bg = "#1F2233" },
       LspReferenceRead = { fg = colors.none, bg = "#1F2233" },
       LspReferenceWrite = { fg = colors.none, bg = "#1F2233" },
       --LspDiagnosticsError = { fg = "#FFF000" },
       --LspDiagnosticsVirtualTextError = { fg = "#FFF000" },


       -- Git Commit Messages
       gitcommitHeader = { fg = colors.purple },
       gitcommitUnmerged = { fg = colors.green },
       gitcommitSelectedFile = { fg = colors.green },
       gitcommitDiscardedFile = { fg = colors.red },
       gitcommitUnmergedFile = { fg = colors.yellow },
       gitcommitSelectedType = { fg = colors.green },
       gitcommitSummary = { fg = colors.blue },
       gitcommitDiscardedType = { fg = colors.red },

       -- i3
       i3ConfigCommand = { fg = colors.blue },
       i3String = { fg = colors.green },
       i3ExecCommand = { fg = colors.green },

       ---- JSON
       jsonBraces = { fg = colors.fg },
       jsonQuote = { fg = colors.fg },

       ---- Markdown
       markdownBold = { fg = colors.pink, },
       markdownBoldDelimiter = { fg = colors.cyan },
       markdownCode = { fg = colors.paleblue },
       markdownCodeDelimiter = { fg = colors.green },
       markdownHeadingDelimiter = { fg = colors.cyan },
       markdownH1 = { fg = colors.yellow },
       markdownH2 = { fg = colors.yellow },
       markdownH3 = { fg = colors.yellow },
       markdownH4 = { fg = colors.yellow },
       markdownH5 = { fg = colors.yellow },
       markdownH6 = { fg = colors.yellow },
       markdownItalic = { fg = colors.pink },
       markdownItalicDelimiter = { fg = colors.cyan },
       markdownLinkDelimiter = { fg = colors.cyan },
       markdownLinkText = { fg = colors.green },
       markdownLinkTextDelimiter = { fg = colors.cyan },
       markdownListMarker = { fg = colors.cyan },
       markdownUrl = { fg = colors.pink, },
       markdownUrlTitleDelimiter = { fg = colors.green },
       mkdBold = { fg = colors.cyan },
       mkdCodeStart = { fg = colors.green },
       mkdCodeDelimiter = { fg = colors.cyan },
       mkdDelimiter = { fg = colors.cyan },
       mkdHeading = { fg = colors.cyan },
       mkdItalic = { fg = colors.cyan },
       mkdLink = { fg = colors.green },
       mkdListItem = { fg = colors.cyan },
       mkdURL = { fg = colors.pink, },

    }
})
