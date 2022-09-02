local current_buf = vim.api.nvim_get_current_buf()
vim.api.nvim_buf_set_lines(current_buf,0, -1, false, {"hello","world"})
vim.api.nvim_create_autocmd("
