-- Move lines with Ctrl+arrow (To move selection check zirrostig/vim-schlep)
vim.keymap.set("n", "<C-Down>", ":m+<CR>")
vim.keymap.set("n", "<C-Up>", ":m-2<CR>")

-- Duplicate line with Ctrl+d (To duplicate selection check zirrostig/vim-schlep)
vim.keymap.set({ 'v', 'n' }, "<C-d>", "mzyyp`z")

-- Delete the word in front of the cursor
vim.keymap.set("i", "<C-D>", "X<Esc>lbce")

-- Replace word under cursor
vim.keymap.set("n", "<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Misc
vim.keymap.set("n", "<leader>f", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Delete on work backward like normal people
-- vim.keymap.set("i", "<C-w>", "<C-\\><C-o>dB")
-- vim.keymap.set("i", "<C-BS>", "<C-\\><C-o>dB")

-- Move between buffers in the same window
vim.keymap.set("n", "<C-A-Up>", "<C-w>k")
vim.keymap.set("n", "<C-A-Down>", "<C-w>j")
vim.keymap.set("n", "<C-A-Left>", "<C-w>h ")
vim.keymap.set("n", "<C-A-Right>", "<C-w>l")

-- Skip text in normal mode
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("n", "<C-Right>", "w")

-- Keep cursor in place when doing J or searching terms
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Nvim Tree
vim.keymap.set("n", "<C-f>", function() return require 'nvim-tree'.toggle(false, true) end)

-- DAP and DAP-UI
vim.keymap.set("n", "<leader>do", function() return require 'dapui'.open() end)
vim.keymap.set("n", "<leader>de", function() return require 'dapui'.close() end)
vim.keymap.set("n", "<leader>dc", function() return require 'dap'.continue() end)
vim.keymap.set("n", "<leader>dn", function() return require 'dap'.step_over() end)
vim.keymap.set("n", "<leader>db", function() return require 'dap'.toggle_breakpoint() end)

-- Colorscheme
vim.keymap.set("n", "<C-n>", function() return require('material.functions').toggle_style() end)

-- Change number when sharing screen 
vim.keymap.set("n", "<C-h>", ":set relativenumber!<CR>") -- toggle

-- Git reset hunk
vim.keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>")

-- Spelling
vim.keymap.set("n", "<C-s>", ":set invspell<CR>") -- toggle
vim.keymap.set("n", "<C-j>", "1z=") -- Fix spelling with first option
vim.keymap.set("n", "<C-i>", ":set spelllang=en<CR>") -- Set spelling in english
vim.keymap.set("n", "<C-e>", ":set spelllang=es<CR>") -- Set spelling in spanish

-- Schleep indention (zirrostig/vim-schlep)
vim.keymap.set("v", "<C-d>", "<Plug>SchleppDup")
vim.keymap.set("v", "<C-Up>", "<Plug>SchleppIndentUp")
vim.keymap.set("v", "<C-Down>", "<Plug>SchleppIndentDown")

-- Commenter (numToStr/Comment.nvim)
local commentapi = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
vim.keymap.set("n", "<C-l>", function() commentapi.toggle.linewise.current() end, { noremap = true, silent = true })
vim.keymap.set('x', '<C-l>',
  function() vim.api.nvim_feedkeys(esc, 'nx', false) commentapi.toggle.linewise(vim.fn.visualmode()) end)

-- Telescope
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>o", ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>")

-- Select with Shift as a normal human being
vim.keymap.set("v", "<S-Up>", "<Up>")
vim.keymap.set("n", "<S-Up>", "V<Up>")
vim.keymap.set("v", "<S-Down>", "<Down>")
vim.keymap.set("v", "<S-Left>", "<Left>")
vim.keymap.set("n", "<S-Down>", "V<Down>")
vim.keymap.set("n", "<S-Left>", "v<Left>")
vim.keymap.set("n", "<C-S-Left>", "<Esc>v")
vim.keymap.set("v", "<S-Right>", "<Right>")
vim.keymap.set("n", "<C-S-Right>", "<Esc>v")
vim.keymap.set("n", "<S-Right>", "v<Right>")
vim.keymap.set("i", "<S-Down>", "<Esc>V<Down>")
vim.keymap.set("i", "<S-Left>", "<Esc>V<Left>")
vim.keymap.set("i", "<S-Right>", "<Esc>V<Right>")

-- Scroll Alt + Shift + Arrows
vim.keymap.set({ "n", "i" }, "<A-k>", "<C-E><C-E>")
vim.keymap.set({ "n", "i" }, "<A-i>", "<C-Y><C-Y>")

-- Copy current line to clipboard
vim.keymap.set('v', '<C-X>', '"+x')
vim.keymap.set('v', '<C-C>', '"+y')

-- Switch tabs with Alt+Tab (Alt+Shift+Tab)
vim.keymap.set("n", "<A-Tab>", "gt")
vim.keymap.set("n", "<A-C-Tab>", "gT")

-- Source current buffer
vim.keymap.set("n", "<leader>r", ":so %<CR>")

-- Encode/Decode selection to/from base64
vim.keymap.set("v", "<leader>u", [[c<c-r>=system('base64 -w 0', @")<cr><esc>]])
vim.keymap.set("v", "<leader>y", [[c<c-r>=system('base64 --decode', @")<cr><esc>]])
