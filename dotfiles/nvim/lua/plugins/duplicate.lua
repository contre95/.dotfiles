-- vim.keymap.set({ "v" }, "<C-S-A-Up>"   ,"<CMD>LineDuplicate -1<CR>")
vim.keymap.set({ "v" }, "<C-d>" ,"<CMD>VisualDuplicate -1<CR>")
return {
	"hinell/duplicate.nvim",
	dependencies = {},
}
