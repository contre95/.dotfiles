require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    always_divide_middle = true,
    disabled_filetypes = {
      'packer',
      'NvimTree',
      winbar = {},           -- only ignores the ft for winbar.
    },
    globalstatus = true, -- This ignores disabled_filetypes so does set laststatus=3
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } }, -- 0 = just filename, 1 = relative path, 2 = absolute path
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
