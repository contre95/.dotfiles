-- Install Packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.api.nvim_command("packadd packer.nvim")
end

-- Use Packer
local packer = require("packer")
local use = packer.use

return require("packer").startup(function()
  use("wbthomason/packer.nvim")
  -- Colorcheme
  use { "kabouzeid/nvim-jellybeans", requires = "rktjmp/lush.nvim" }
  use({ 'marko-cerovac/material.nvim' })
  use("kvrohit/rasmus.nvim")
  use("norcalli/nvim-colorizer.lua")
  --use({
  --'rose-pine/neovim',
  --as = 'rose-pine',
  --config = function()
  --require("rose-pine").setup()
  --vim.cmd('colorscheme rose-pine')
  --end
  --})
  -- Statusline
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  -- Navigation
  use("akinsho/nvim-bufferline.lua")
  use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ 'nvim-tree/nvim-web-devicons' })
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  })
  use("unblevable/quick-scope")
  use('eandrju/cellular-automaton.nvim')
  -- Git
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use("knsh14/vim-github-link")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "leoluz/nvim-dap-go", "mortepau/codicons.nvim" } })
  -- LSP / CMP / Snippets / Parsers
  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/playground")
  use("neovim/nvim-lspconfig")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip-integ")
  use("hrsh7th/vim-vsnip")
  use("rafamadriz/friendly-snippets")
  use("hrsh7th/cmp-nvim-lsp")
  use("onsails/lspkind-nvim")
  -- Editting
  use("ekickx/clipboard-image.nvim")
  use("zirrostig/vim-schlepp")
  use("scrooloose/nerdcommenter")
end)
