--local attach_to_buffer = function(bufnr, pattern, command)
  --vim.api.nvim_create_autocmd("BufWritePost", {
    --group = vim.api.nvim_create_augroup("TestingAugroup", { clear = true }),
    --pattern = pattern,
    --callback = function()
      --local jobstart_callback= function(_, data)
        --if not data then
          --print("No data received")
          --return
        --end
        --for _, line in ipairs(data) do
          --print(line)
          --local decoded_line = vim.json.decode(line)
          --if decoded_line.Action == 'run' then
            ------vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, decoded_line)
          --elseif decoded_line.Action == 'output' then
            ----vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, decoded_line)
          --end
        --end
      --end

      --vim.fn.jobstart(command, {
        --stdout_buffered = true,
        --on_stdout = jobstart_callback, -- The vim.fn.jobstart() takes a callback func and passes the std<our/err> of of the "command"
        --on_stderr = jobstart_callback,
      --})
    --end
  --})
--end


--local bufnr = vim.api.nvim_get_current_buf()
--attach_to_buffer(bufnr, "*.go", { 'go', 'test', './...', '-json' })
--#region



