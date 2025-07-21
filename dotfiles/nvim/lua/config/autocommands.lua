
vim.filetype.add({
  filename = {
    [".envrc"] = "sh",
    ["%.?env.*"] = "config",
  }
})

-- Set Terrafrom vars
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format(nil, 10000)
  end
})

-- Open help always vertical
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Set Caddyfile
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "Caddyfile", "*.Caddyfile", "Caddyfile.*" , "caddy"},
  command = "set ft=caddy",
})

-- -- Set HTMX
--  vim.api.nvim_create_autocmd("Filetype", {
--  	pattern = { "html", "shtml", "htm" },
--  	callback = function()
--  		vim.lsp.start({
--  			name = "superhtml",
--  			cmd = { "superhtml", "lsp" },
--  			root_dir = vim.fs.dirname(vim.fs.find({".git"}, { upward = true })[1])
--  		})
--  	end
--  })

-- Set Golang
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
  end,
})

-- Set Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    -- vim.opt_local.textwidth = 80
    -- vim.opt_local.colorcolumn = "-2"
  end,
})

-- Set GraphQL
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.graphql", "*.graphqls", "*.gql" },
  command = "setfiletype graphql",
})

-- Set GitCommits
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.cmd("setlocal complete+=kspell")
  end,
})

-- Set Dockerfile filetype
vim.api.nvim_create_augroup("docker_ft_detection", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "docker_ft_detection",
  pattern = "Dockerfile.*",
  command = "set filetype=dockerfile",
})

-- Set Julia filetype
vim.api.nvim_create_augroup("julia_ft_detection", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "julia_ft_detection",
  pattern = "*.jl",
  command = "set filetype=julia",
})

-- Set Hyprland
vim.api.nvim_create_augroup("hypr_ftdetect", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "hypr_ftdetect",
  pattern = { "*hypr/*.conf", "*hypr/*/*.conf" },
  command = "set ft=hyprlang| set syntax=hyprlang",
})

-- Set Rofi style filetype
vim.api.nvim_create_augroup("roficss_ft_detection", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "roficss_ft_detection",
  pattern = "*.rasi",
  command = "set filetype=css",
})

-- Sementary of filetypes autocommands

-- -- Set Logstash filetype (Sad days in my career)
-- local function detect_logstash()
--   if vim.fn.getline(1):match('^[ \t]*input {') then
--     vim.cmd("set ft=logstash")
--   end
-- end
-- Set Logstash
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "logstash",
--   command = "setlocal commentstring=#\\ %s"
-- })
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   pattern = "*.conf",
--   callback = detect_logstash
-- })

-- -- Set Salt
-- vim.api.nvim_create_augroup("salt_ft_detection", { clear = true })
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   group = "salt_ft_detection",
--   pattern = "*.sls",
--   command = "set filetype=yaml"
-- })

-- -- Set i3config filetype
-- vim.api.nvim_create_augroup("i3config_ft_detection", { clear = true })
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   group = "i3config_ft_detection",
--   pattern = "~/.config/i3/config",
--   command = "set filetype=i3"
-- })

-- -- Set SXHKD filetype
-- vim.api.nvim_create_augroup("sxhkd_ft_detection", { clear = true })
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   group = "sxhkd_ft_detection",
--   pattern = {"sxhkdrc", "*.sxhkdrc"},
--   command = "set ft=sxhkdrc"
-- })
