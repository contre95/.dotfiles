local attach_to_buffer = function(bufnr, pattern, command)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("TestingAugroup", { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, data)
        end
      end
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end
  })
end


--attach_to_buffer(current_buf, "*.go", { "go", "run", "main.go" })

vim.api.nvim_create_user_command('RunAsideOnSave', function()
  local command = vim.fn.input("Command: ")
  local pattern = vim.fn.input("Pattern: ")
  vim.api.nvim_command('botright vsplit new') -- split a new window
  local current_buf = vim.api.nvim_get_current_buf()
  attach_to_buffer(current_buf, pattern, command)
  vim.api.nvim_command('wincmd p') -- go back to previous window
end, {})


--jobID = vim.api.nvim_call_function("termopen", { "$SHELL" })
