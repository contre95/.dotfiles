return {
    'gorbit99/codewindow.nvim',
    opts = {},
    config = function(_)
      vim.api.nvim_create_user_command('MM', function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.toggle_minimap()
    end, {})
  end,
}
