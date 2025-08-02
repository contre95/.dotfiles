-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  lockfile = "~/.config/lazy-lock.json", -- I'm moving this cause I'm symlinking the ~/.config/nvim with home-manager. This results in the file being read-only 
  install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
