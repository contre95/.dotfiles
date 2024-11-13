-- Transparent Background
vim.api.nvim_create_user_command("LetMeSee", function()
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineFold", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })
end, {})

-- Share code -- Only Linux. For Mac, see: https://gist.github.com/shmup/db671132f0f9882187b28a677fa8df72
vim.cmd [[
    command! -range=% TB <line1>,<line2>w !nc termbin.com 9999 | tr -d '\n' | wl-copy -i -selection clipboard
    command! -range=% IX <line1>,<line2>w !curl -F 'f:1=<-' http://ix.io | tr -d '\n' | wl-copy -i -selection clipboard
    command! -range=% EN <line1>,<line2>w !curl -F 'file=@-;' https://envs.sh | tr -d '\n' | wl-copy -i -selection clipboard
    command! -range=% VP <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | wl-copy -i -selection clipboard
    command! -range=% CL <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | wl-copy -i -selection clipboard
    command! -range=% SP <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | wl-copy -i -selection clipboard
]]

-- Terraform check
vim.api.nvim_create_user_command('Tfsec', function()
  vim.cmd("vsplit term:// tfsec %:p:h")
end, {})

-- Git add
vim.api.nvim_create_user_command('GitAdd', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  vim.fn.jobstart({ "git", "add", filename })
end, {})

-- Order lines by length
vim.cmd [[command! -range SortLen <line1>,<line2> !awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }']]

