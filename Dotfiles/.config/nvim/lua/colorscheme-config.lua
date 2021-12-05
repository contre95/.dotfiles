local colors = require('material/colors')
require('material').setup({

    contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
    borders = true, -- Enable borders between verticaly split windows

    popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

    italics = {
        comments = true, -- Enable italic comments
    },

    contrast_windows = { -- Specify which windows get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf" -- Darker qf list background
    },

    text_contrast = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true-- Enable higher contrast text for darker style
    },

    disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = true, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

      custom_highlights = {
          
    ---- Common
    Identifier = { fg = colors.cyan },
    Todo = { fg = colors.yellow, style = 'bold' },
    DiffAdd = { bg = '#45493e', fg = colors.none },
    DiffChange = { bg = '#384851', fg = colors.none },
    DiffDelete = { bg = colors.none, fg = colors.selection },
    DiffText = { bg = '#5b7881', fg = colors.none },
    MatchParen = { fg = colors.comments, bg = colors.cyan },
    Search = { fg = colors.white, bg = colors.comments },
    IncSearch = { fg = colors.white, bg = colors.comments },
    StatusLine = { fg = colors.comments, bg = colors.bg },
    StatusLineNC = { fg = colors.selection, bg = colors.bg },
    LspReferenceText = { fg = colors.none, bg = '#1F2233' },
    LspReferenceRead = { fg = colors.none, bg = '#1F2233' },
    LspReferenceWrite = { fg = colors.none, bg = '#1F2233' },

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
    i3ConfigCommand = {fg = colors.blue},
    i3String = {fg = colors.green},
    i3ExecCommand = {fg = colors.green},
    

    -- NvimTree
    NvimTreeIndentMarker = { fg = colors.selection },
    NvimTreeNormal = { bg = colors.contrast },
    NvimTreeFolderIcon = {},

    -- CSS
    cssAttrComma = { fg = colors.fg },
    cssPseudoClassId = { fg = colors.yellow },
    cssBraces = { fg = colors.fg },
    cssClassName = { fg = colors.yellow },
    cssClassNameDot = { fg = colors.yellow },
    cssFunctionName = { fg = colors.blue },
    cssImportant = { fg = colors.cyan },
    cssIncludeKeyword = { fg = colors.purple },
    cssTagName = { fg = colors.red },
    cssMediaType = { fg = colors.orange },
    cssProp = { fg = colors.fg },
    cssSelectorOp = { fg = colors.cyan },
    cssSelectorOp2 = { fg = colors.cyan },
    cssAttr = { fg = colors.orange },

    ------ JavaScript
    javaScriptBraces = { fg = colors.fg },
    javaScriptNull = { fg = colors.orange },
    javaScriptIdentifier = { fg = colors.purple },
    javaScriptNumber = { fg = colors.orange },
    javaScriptRequire = { fg = colors.cyan },
    javaScriptReserved = { fg = colors.purple },
    jsArrowFunction = { fg = colors.purple },
    jsAsyncKeyword = { fg = colors.purple },
    jsBooleanTrue = { fg = colors.orange },
    jsBooleanFalse = { fg = colors.orange },
    jsBrackets = { fg = colors.pink },
    jsCatch = { fg = colors.cyan, style = 'italic' },
    jsClassBraces = { fg = colors.cyan },
    jsClassDefinition = { fg = colors.yellow },
    jsClassFuncName = { fg = colors.pink },
    jsClassProperty = { fg = colors.pink },
    jsClassKeyword = { fg = colors.purple },
    jsConditional = { fg = colors.cyan, style = 'italic' },
    jsDocParam = { fg = colors.green },
    jsDocTags = { fg = colors.cyan },
    jsDot = { fg = colors.cyan },
    jsException = { fg = colors.cyan, style = 'italic' },
    jsExceptions = { fg = colors.yellow },
    jsExport = { fg = colors.cyan, style = 'italic' },
    jsExportDefault = { fg = colors.cyan, style = 'italic' },
    jsExtendsKeyword = { fg = colors.purple },
    jsFinally = { fg = colors.cyan, style = 'italic' },
    jsFinallyBraces = { fg = colors.cyan },
    jsFlowArgumentDef = { fg = colors.yellow },
    jsForAwait = { fg = colors.cyan, style = 'italic' },
    jsFrom = { fg = colors.cyan, style = 'italic' },
    jsFuncBraces = { fg = colors.cyan },
    jsFuncCall = { fg = colors.blue },
    jsFuncParens = { fg = colors.cyan },
    jsFunction = { fg = colors.purple },
    jsFunctionKey = { fg = colors.pink },
    jsGlobalObjects = { fg = colors.yellow },
    jsGlobalNodeObjects = { fg = colors.yellow },
    jsIfElseBraces = { fg = colors.cyan },
    jsImport = { fg = colors.cyan, style = 'italic' },
    jsModuleAs = { fg = colors.cyan, style = 'italic' },
    jsModuleBraces = { fg = colors.cyan },
    jsNull = { fg = colors.cyan },
    jsNoise = { fg = colors.cyan },
    jsObjectBraces = { fg = colors.cyan },
    jsObjectColon = { fg = colors.cyan },
    jsObjectKey = { fg = '#8f93a2' },
    jsObjectSeparator = { fg = colors.cyan },
    jsParens = { fg = colors.pink },
    jsRepeat = { fg = colors.cyan, style = 'italic' },
    jsReturn = { fg = colors.cyan, style = 'italic' },
    jsStorageClass = { fg = colors.purple },
    jsTemplateBraces = { fg = colors.cyan },
    jsTemplateExpression = { fg = colors.fg },
    jsTemplateString = { fg = colors.green },
    jsThis = { fg = colors.cyan, style = 'italic' },
    jsTry = { fg = colors.cyan, style = 'italic' },
    jsTryCatchBraces = { fg = colors.cyan },
    jsUndefined = { fg = colors.cyan },
    jsVariableDef = { fg = colors.red },

    ---- TypeScript
   typescriptVariableDeclaration = { fg = colors.blue},
   typescriptInterfaceName = { fg = colors.yellow },

    -- JSX
    jsxTag = { fg = colors.cyan },
    jsxTagName = { fg = colors.pink },
    jsxComponentName = { fg = colors.yellow },
    jsxCloseTag = { fg = colors.cyan },
    jsxEscapeJs = { fg = colors.fg },
    jsxCloseString = { fg = colors.cyan },
    jsxAttrib = { fg = colors.purple, style = 'italic' },
    jsxString = { fg = colors.green },
    jsxEqual = { fg = colors.purple },
    jsxDot = { fg = colors.cyan },
    jsxSpreadOperator = { fg = colors.purple },
    jsxBraces = { fg = colors.cyan },
    jsxNamespace = { fg = colors.cyan },

    -- JSON
    jsonBraces = { fg = colors.fg },
    jsonQuote = { fg = colors.fg },

    -- HTML
    htmlTagName = { fg = colors.pink },
    htmlEndTag = { fg = colors.cyan },
    htmlTag = { fg = colors.cyan },
    htmlSpecialTagName = { fg = colors.yellow },
    htmlArg = { fg = colors.purple, style = 'italic' },
    htmlTitle = { fg = colors.fg },
    htmlLink = { fg = colors.fg },
    htmlBold = { fg = colors.pink, style = 'bold' },
    htmlH1 = { fg = colors.yellow },
    htmlH2 = { fg = colors.yellow },
    htmlH3 = { fg = colors.yellow },
    htmlH4 = { fg = colors.yellow },
    htmlH5 = { fg = colors.yellow },
    htmlH6 = { fg = colors.yellow },
    htmlItalic = { fg = colors.pink, style = 'italic' },

    -- XML
    xmlAttrib = { fg = colors.purple, style = 'italic' },
    xmlEndTag = { fg = colors.cyan },
    xmlTag = { fg = colors.cyan },
    xmlTagName = { fg = colors.pink },

    -- Markdown
    markdownBold = { fg = colors.pink, style = 'bold' },
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
    markdownItalic = { fg = colors.pink, style = 'italic' },
    markdownItalicDelimiter = { fg = colors.cyan },
    markdownLinkDelimiter = { fg = colors.cyan },
    markdownLinkText = { fg = colors.green },
    markdownLinkTextDelimiter = { fg = colors.cyan },
    markdownListMarker = { fg = colors.cyan },
    markdownUrl = { fg = colors.pink, style = 'underline' },
    markdownUrlTitleDelimiter = { fg = colors.green },
    mkdBold = { fg = colors.cyan },
    mkdCodeStart = { fg = colors.green },
    mkdCodeDelimiter = { fg = colors.cyan },
    mkdDelimiter = { fg = colors.cyan },
    mkdHeading = { fg = colors.cyan },
    mkdItalic = { fg = colors.cyan },
    mkdLink = { fg = colors.green },
    mkdListItem = { fg = colors.cyan },
    mkdURL = { fg = colors.pink, style = 'underline' },

    -- Go
    goFunction = { fg =colors.red},
    goImportString = { fg =colors.red},
    goString = { fg =colors.red},
    goStringGroup = { fg =colors.red},
    goSpecialString = { fg =colors.red},
    goFunctionReturn = { fg =colors.red},

  }
})
