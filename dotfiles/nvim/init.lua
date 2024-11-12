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

-- Leader key
vim.g.mapleader = " "

-- Lua imports
require("config.lazy")
require("config.settings")
require("config.commands")
require("config.mappings")

vim.cmd("colorscheme kanagawa")
--
---- Vim Imports
vim.cmd("so ~/.config/nvim/autocomands.vim")
