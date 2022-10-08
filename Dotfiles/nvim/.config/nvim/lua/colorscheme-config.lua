local variants = require("rasmus.colors")
local cfg = require("rasmus.config").config
local c = variants[cfg.variant]

vim.g.rasmus_bold_keywords = true
vim.g.rasmus_italic_variables = true
vim.g.rasmus_italic_comments = true
vim.g.rasmus_italic_functions = true

vim.cmd 'colorscheme rasmus'


--https://github.com/kvrohit/rasmus.nvim/blob/main/lua/rasmus/init.lua

local cusotm_highlights = {
  'highlight jsonNumber guifg=' .. c.yellow,
  'highlight jsonNull guifg=' .. c.bright_black,
  'highlight jsonString guifg=' .. c.green,
  'highlight jsonKeyword guifg=' .. c.blue,
}

for _, hicmd in ipairs(cusotm_highlights) do
  vim.cmd(hicmd)
end
