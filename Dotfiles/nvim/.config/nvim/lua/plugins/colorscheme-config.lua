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
  'highlight Function guifg=' .. c.green,
  'highlight Identifier guifg=' .. c.white,
  'highlight @field guifg=' .. c.blue,
  'highlight @type guifg=' .. c.magenta,
  'highlight @type.definition guifg=' .. c.yellow,
  'highlight goBlock guifg=' .. c.cyan,
  'highlight Label guifg=' .. c.blue,
  'highlight Number guifg=' .. c.yellow,
  'highlight Boolean guifg=' .. c.magenta,
  'highlight @constant.builtin guifg=' .. c.bright_black,
  'highlight NonText guibg=#121211',
  'highlight Normal guibg=#121211',
  'highlight NormalNC guibg=#121211',
  'highlight SignColumn guibg=#121211',
  'highlight LineNr guibg=#121211',
  --Html
  'highlight @tag guifg=#E06C75',
  'highlight @tag.delimeter guifg=#EFEFEF',
  'highlight @tag.attribute guifg=#D19961',

}

for _, hicmd in ipairs(cusotm_highlights) do
  vim.cmd(hicmd)
end
