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

-- Plugins
require("plugins") -- Plugins installed with packer
require("lsp") -- lspconfig
require("finder") -- telescope
require("snippets") -- vsnip
require("completion") -- nvim-cmp
require("git-config") -- gitSigns
require("statusline") -- lualine
require("nvim-tree-config")
require("blankline-config")
require("md-fenced-config")
require("treesitter-config")
require("quick-scope-config")
require("bufferline-config")
require("schlepp-config")
require("colorscheme-config")

-- Leader key
vim.g.mapleader = " "

-- Color Scheme
vim.cmd("colorscheme material")
vim.g.material_style = "deep ocean"

---- Vim Imports
vim.cmd("so ~/.config/nvim/settings.vim")
vim.cmd("so ~/.config/nvim/mappings.vim")
vim.cmd("so ~/.config/nvim/commands.vim")
vim.cmd("so ~/.config/nvim/filetypes.vim")
vim.cmd("so ~/.config/nvim/misc.vim")
