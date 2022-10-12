-- git add/commit
vim.api.nvim_create_user_command('GitAdd', function ()
   local msg = vim.fn.input('msg: ')
   local bufnr = vim.api.nvim_get_current_buf()
   local filename = vim.api.nvim_buf_get_name(bufnr)
   vim.fn.jobstart({"git", "add", filename})
   vim.fn.jobstart({"git", "commit", "-m", msg})
end, {})

-- git push
vim.api.nvim_create_user_command('GitPush', function ()
   vim.fn.jobstart({"git", "push"})
end, {})

-- git pull
vim.api.nvim_create_user_command('GitPull', function ()
   vim.fn.jobstart({"git", "pull"})
end, {})

