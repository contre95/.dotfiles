"                              ___           ___           ___
"     ___        ___          /__/\         /  /\         /  /\
"    /__/\      /  /\        |  |::\       /  /::\       /  /:/
"    \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/
"     \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___
" ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"/__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"\  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/
" \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/
"  \__\::::/      \__\/      \  \:\        \  \:\        \  \::/
"      ~~~~                   \__\/         \__\/         \__\/
"


" -- Leader key
let mapleader = " "                                                                     

" -- Color Scheme
colorscheme jellybeans

" -- Plugins
lua require('plugins')
lua require "top-bufferline"
lua require "statusline"

" -- Vim Imports 
let conf_path = '~/.config/nvim/'
so /home/contre/.config/nvim/vim-settings.vim
so /home/contre/.config/nvim/vim-maps.vim
so /home/contre/.config/nvim/plugins-settings.vim
so /home/contre/.config/nvim/files-type-settings.vim
so /home/contre/.config/nvim/misc.vim
