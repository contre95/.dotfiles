-- Move lines with Ctrl+arrow (To move selection check zirrostig/vim-schlep)
vim.keymap.set("n", "<C-Down>", ":m+<CR>")
vim.keymap.set("n", "<C-Up>", ":m-2<CR>")

-- Duplicate line with Ctrl+d (To duplicate selection check zirrostig/vim-schlep)
vim.keymap.set({ 'v', 'n' }, "<C-d>", "mzyyp`z")

-- Delete the word in front of the cursor
vim.keymap.set("i", "<C-D>", "X<Esc>lbce")

-- Find and Replace with Ctrl+r
vim.keymap.set("n", "<C-r>", ":%s/")

vim.keymap.set("n", "<C-A-Right>", "<C-w>l")
vim.keymap.set("n", "<C-A-Left>", "<C-w>h ")
vim.keymap.set("n", "<C-A-Down>", "<C-w>j")
vim.keymap.set("n", "<C-A-Up>", "<C-w>k")

-- Keep cursor in place when doing J, Ctrl+u, Ctrl+d, or searching terms
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- DAP and DAP-UI
vim.keymap.set("n", "<leader>do", function() return require'dapui'.open() end)
vim.keymap.set("n", "<leader>de", function() return require'dapui'.close() end)
vim.keymap.set("n", "<leader>dc", function() return require'dap'.continue() end)
vim.keymap.set("n", "<leader>dn", function() return require'dap'.step_over() end)
vim.keymap.set("n", "<leader>db", function() return require'dap'.toggle_breakpoint() end)

-- Git reset hunk
vim.keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>")

-- Spelling
vim.keymap.set("n", "<leader>s", ":set invspell<CR>") -- toggle
vim.keymap.set("n","<leader>j","1z=") -- Fix spelling with first option

-- Schleep indention (zirrostig/vim-schlep)
vim.keymap.set("v", "<C-Down>", "<Plug>SchleppIndentDown")
vim.keymap.set("v", "<C-Up>", "<Plug>SchleppIndentUp")
vim.keymap.set("v", "<C-d>", "<Plug>SchleppDup")

-- NerdCommenter (scrooloose/nerdcommenter)
vim.keymap.set("n", "<C-l>", "<Plug>NERDCommenterToggle <Down>")
vim.keymap.set("n", "<C-A-l>", "<Plug>NERDCommenterToggle <Up>")
vim.keymap.set("v", "<C-l>", "<Plug>NERDCommenterToggle<CR>gv")

-- Telescope
vim.keymap.set("n", "<leader>o", ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>")
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<cr>")

-- Select with Shift as a normal human being
vim.keymap.set("i", "<S-Right>", "<Esc>V<Right>")
vim.keymap.set("i", "<S-Left>", "<Esc>V<Left>")
vim.keymap.set("i", "<S-Down>", "<Esc>V<Down>")
vim.keymap.set("n", "<S-Right>", "v<Right>")
vim.keymap.set("v", "<S-Right>", "<Right>")
vim.keymap.set("n", "<S-Down>", "V<Down>")
vim.keymap.set("n", "<S-Left>", "v<Left>")
vim.keymap.set("v", "<S-Down>", "<Down>")
vim.keymap.set("v", "<S-Left>", "<Left>")
vim.keymap.set("n", "<S-Up>", "V<Up>")
vim.keymap.set("v", "<S-Up>", "<Up>")
vim.keymap.set("n", "<C-S-Right>", "<Esc>v")
vim.keymap.set("n", "<C-S-Left>", "<Esc>v")

-- Scroll Alt + Shift + Arrows
vim.keymap.set({ "n", "i" }, "<A-k>", "<C-E><C-E>")
vim.keymap.set({ "n", "i" }, "<A-i>", "<C-Y><C-Y>")

-- Copy current line to clipboard
vim.keymap.set('v', '<C-X>', '"+x')
vim.keymap.set('v', '<C-C>', '"+y')

-- Switch tabs with Alt+Tab (Alt+Shift+Tab)
vim.keymap.set("n", "<A-Tab>", "gt")
vim.keymap.set("n", "<A-C-Tab>", "gT")

--vim.cmd[[
--nnorvim.keymap.set("e","<silent>","<leader>r :source %<CR>")
--nnorvim.keymap.set("e","<silent>","<leader>m :call jobstart(printf('livedown start %s --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242"',@%),{'detach':1})<CR><CR>")
--]]
