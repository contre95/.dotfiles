return {
  'zirrostig/vim-schlepp',
  opts = {},
  config = function()
    vim.keymap.set("v", "<C-d>", "<Plug>SchleppDup")
    vim.keymap.set("v", "<C-Up>", "<Plug>SchleppIndentUp")
    vim.keymap.set("v", "<C-Down>", "<Plug>SchleppIndentDown")
  end,
}