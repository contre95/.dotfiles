require"gitlinker".setup()

-- Define the :GithubCopy command for visual mode
vim.api.nvim_create_user_command('GithubCopy', function()
  require('gitlinker').get_buf_range_url('v', {
    action_callback = require('gitlinker.actions').copy_to_clipboard
  })
end, { range = true })

-- Define the :GithubOpen command for visual mode
vim.api.nvim_create_user_command('GithubOpen', function()
  require('gitlinker').get_buf_range_url('v', {
    action_callback = require('gitlinker.actions').open_in_browser
  })
end, { range = true })

