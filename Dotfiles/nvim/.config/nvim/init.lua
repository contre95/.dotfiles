--[[
      ___                                    ___     
     /__/\          ___        ___          /__/\    
     \  \:\        /__/\      /  /\        |  |::\   
      \  \:\       \  \:\    /  /:/        |  |:|:\  
  _____\__\:\       \  \:\  /__/::\      __|__|:|\:\ 
 /__/::::::::\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
 \  \:\~~\~~\/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
  \  \:\  ~~~  \  \:\|  |:|     \__\::/  \  \:\      
   \  \:\       \  \:\__|:|     /__/:/    \  \:\     
    \  \:\       \__\::::/      \__\/      \  \:\    
     \__\/           ~~~~                   \__\/    
--]]

-- Lua setings
require("commands")
require("settings")

-- Plugins
require("plugins")
require("plugins/lsp")
require("plugins/dap")
require("plugins/true-zen")
require("plugins/schlepp-config")
require("plugins/gitsigns-config")
require("plugins/nvim-cmp-config")
require("plugins/md-fenced-config")
require("plugins/nvim-tree-config")
require("plugins/telescope-config")
require("plugins/bufferline-config")
require("plugins/statusline-config")
require("plugins/treesitter-config")
require("plugins/colorscheme-config")
require("plugins/quick-scope-config")

-- Leader key
vim.g.mapleader = " "

---- Vim Imports
vim.cmd("so ~/.config/nvim/misc.vim")
vim.cmd("so ~/.config/nvim/mappings.vim")
vim.cmd("so ~/.config/nvim/commands.vim")
vim.cmd("so ~/.config/nvim/autocomands.vim")
