-- Git Add/Commit
vim.api.nvim_create_user_command('GitAdd', function ()
   local msg = vim.fn.input('Msg: ')
   local bufnr = vim.api.nvim_get_current_buf()
   local filename = vim.api.nvim_buf_get_name(bufnr)
   vim.fn.jobstart({"git", "add", filename})
   vim.fn.jobstart({"git", "commit", "-m", msg})
end, {})

vim.api.nvim_create_user_command('GitPush', function ()
   vim.fn.jobstart({"git", "push"})
end, {})

vim.api.nvim_create_user_command('GitPull', function ()
   vim.fn.jobstart({"git", "pull"})
end, {})
