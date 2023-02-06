--[[
--
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

-- Plugins
require("plugins")
require("plugins/lsp")
require("plugins/dap")
require("plugins/colorizer")
require("plugins/schlepp-config")
require("plugins/gitsigns-config")
require("plugins/nvim-cmp-config")
require("plugins/nvim-tree-config")
require("plugins/telescope-config")
require("plugins/bufferline-config")
require("plugins/statusline-config")
require("plugins/treesitter-config")
require("plugins/quick-scope-config")
require("plugins/colorscheme-config")


-- Leader key
vim.g.mapleader = " "
require("settings")
require("commands")
require("mappings")

---- Vim Imports
vim.cmd("so ~/.config/nvim/autocomands.vim")
