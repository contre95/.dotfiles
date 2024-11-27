local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-Up>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<C-S-Left>", ":MoveWord(1)<CR>", opts)
vim.keymap.set("n", "<C-S-Right>", ":MoveWord(-1)<CR>", opts)
vim.keymap.set("v", "<C-Up>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<C-Down>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<C-S-Left>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<C-S-Right>", ":MoveHBlock(1)<CR>", opts)
return {
	"fedepujol/move.nvim",
	opts = {
		line = {
			enable = true, -- Enables line movement
			indent = true, -- Toggles indentation
		},
		block = {
			enable = true, -- Enables block movement
			indent = true, -- Toggles indentation
		},
		word = {
			enable = true, -- Enables word movement
		},
		char = {
			enable = false, -- Enables char movement
		},
	},
}
