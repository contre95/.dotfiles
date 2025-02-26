-- Copy current line to clipboard
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('v', '<C-X>', '"+x')
vim.keymap.set('v', '<C-C>', '"+yy')

return {
  "ojroques/nvim-osc52",
  opts = {
    max_length = 0,        -- Maximum length of selection (0 for no limit)
    silent = false,        -- Disable message on successful copy
    trim = false,          -- Trim surrounding whitespaces before copy
    tmux_passthrough = true, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
  },
}
