-- Move lines with Ctrl+arrow (To move selection check zirrostig/vim-schlep)
vim.keymap.set("n", "<C-Down>", ":m+<CR>")
vim.keymap.set("n", "<C-Up>", ":m-2<CR>")

-- Duplicate line with Ctrl+d (To duplicate selection check zirrostig/vim-schlep)
vim.keymap.set({ "v", "n" }, "<C-d>", "mzyyp`z")

-- Delete the word in front of the cursor
vim.keymap.set("i", "<C-D>", "X<Esc>lbce")

-- Replace word under cursor
vim.keymap.set("n", "<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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

-- Change number when sharing screen
vim.keymap.set("n", "<C-h>", ":set relativenumber!<CR>") -- toggle

-- Spelling
vim.keymap.set("n", "<C-s>", ":set invspell<CR>") -- toggle
vim.keymap.set("n", "<C-j>", "1z=")               -- Fix spelling with first option

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

-- Switch tabs with Alt+Tab (Alt+Shift+Tab)
vim.keymap.set("n", "<A-Tab>", "gt")
vim.keymap.set("n", "<A-C-Tab>", "gT")

-- Source current buffer
vim.keymap.set("n", "<leader>l", ":so %<CR>")

-- Encode/Decode selection to/from base64
vim.keymap.set("v", "<leader>u", [[c<c-r>=system('base64 -w 0', @")<cr><esc>]])
vim.keymap.set("v", "<leader>y", [[c<c-r>=system('base64 --decode', @")<cr><esc>]])
vim.keymap.set("n", "<C-g>", function()
  require("avante").toggle()
end)

local colorschemes = { "immortal", "dark-funeral", "emperor", "kanagawa-dragon", "github_dark_default", "nile"}
local all_colorschemes = vim.fn.getcompletion("", "color")

local current_index = 0

vim.keymap.set("n", "<C-m>", function()
  current_index = current_index + 1
  if current_index > #all_colorschemes then
    current_index = 1
  end
  vim.cmd("colorscheme " .. all_colorschemes[current_index])
  print("Colorscheme: " .. all_colorschemes[current_index])
end)

vim.keymap.set("n", "<C-n>", function()
  current_index = current_index + 1
  if current_index > #colorschemes then
    current_index = 1
  end
  vim.cmd("colorscheme " .. colorschemes[current_index])
  print("Colorscheme: " .. colorschemes[current_index])
end)
