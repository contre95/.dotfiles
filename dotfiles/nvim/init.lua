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
require("config.autocommands")

-- vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme immortal")
--
---- Vim Imports
