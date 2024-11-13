return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      ignore = nil,
      mappings = {
        basic = false,
        extra = false,
      },
      pre_hook = nil,
      post_hook = nil,
    })
    local commentapi = require('Comment.api')
    local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
    vim.keymap.set("n", "<C-l>", function() commentapi.toggle.linewise.current() end, { noremap = true, silent = true })
    vim.keymap.set('x', '<C-l>',
      function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        commentapi.toggle.linewise(vim.fn.visualmode())
      end)
  end
}
