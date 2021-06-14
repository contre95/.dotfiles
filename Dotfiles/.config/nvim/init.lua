--                                    ___           ___           ___
--           ___        ___          /__/\         /  /\         /  /\
--          /__/\      /  /\        |  |::\       /  /::\       /  /:/
--          \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/
--           \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___
--       ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
--      /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
--      \  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/
--       \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/
--        \__\::::/      \__\/      \  \:\        \  \:\        \  \::/
--            ~~~~                   \__\/         \__\/         \__\/

-- Leader key
vim.api.nvim_set_var('mapleader', " ") -- Alternative: vim.g.mapleader = " "

-- Color Scheme
vim.api.nvim_set_option('termguicolors',true)
vim.cmd('colorscheme jellybeans')

-- Plugins
require("plugins")
require("nvimTree")
require("statusline")
require("top-bufferline")
require("treesitter-nvim")

-- Vim Imports 
vim.cmd("so /home/contre/.config/nvim/misc.vim")
vim.cmd("so /home/contre/.config/nvim/vim-maps.vim")
vim.cmd("so /home/contre/.config/nvim/files-type-settings.vim")
vim.cmd("so /home/contre/.config/nvim/plugins-settings.vim")
vim.cmd("so /home/contre/.config/nvim/vim-settings.vim")
vim.cmd("so /home/contre/.config/nvim/vim-highlights.vim")
