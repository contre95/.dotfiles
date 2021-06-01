-- In this file you will find all settings related to vim

-- Guide on how this relates to a normals "~/.vimrc" file
---------------------------------------------------------
-- vim.o.{option}: behaves like :set
-- vim.go.{option}: behaves like :setglobal
-- vim.bo.{option}: behaves like :setlocal for buffer-local options
-- vim.wo.{option}: behaves like :setlocal for window-local options



-- Treat end of lines like normal IDE                                                                                                                                                                                
-------------------------------------                                                                                                                                                                             
vim.o.virtualedit="all" 
vim.o.sel="exclusive"

-- Common Settings
-------------------------------------                                                                                                                                                                             
vim.o.guifont="JetBrainsMono 30"
vim.o.guicursor = "n-v-ve-i-c-ci:ver25"
vim.o.undodir="~/.vim/undodir"
vim.o.guicursor="n-v-ve-i-c-ci:ver25"
vim.o.pastetoggle="<F9>"
vim.o.encoding="utf-8"
vim.o.relativenumber=true
vim.o.tabpagemax=4 
vim.o.laststatus=2
vim.o.shiftwidth=4
vim.o.cursorcolumn=false
vim.o.smartindent=true
vim.o.splitbelow=true
vim.o.cursorline=true
vim.o.autoindent=true
vim.o.splitright=true
vim.o.ignorecase=true
vim.o.showmatch	=true
vim.o.smarttab=true
vim.o.incsearch=true
vim.o.hlsearch=true
vim.o.wildmenu=true
vim.o.number=true
vim.o.nu=true
vim.o.termguicolors=true
-- vim.o.noswapfile=true
-- vim.o.spelllang=en
--vim.o.expandtab ts=4 sw=4 ai


