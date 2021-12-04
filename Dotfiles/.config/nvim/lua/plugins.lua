local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return require("packer").startup(function()
    use 'marko-cerovac/material.nvim'

    use "wbthomason/packer.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
    -- use {
    -- "luukvbaal/stabilize.nvim",
    -- config = function() require("stabilize").setup() end
    -- }
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup() end
    }
    use "akinsho/nvim-bufferline.lua"
    use "alvan/vim-closetag"

    --
    -- -- Language Specific
    use 'fatih/vim-go'
    use 'hashivim/vim-terraform'

    -- Auto-Completion and LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use "rafamadriz/friendly-snippets"
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'onsails/lspkind-nvim'
    -- use {'neoclide/coc.nvim', branch = 'release'}
    --
    -- -- Other
    use 'ekickx/clipboard-image.nvim'
    use 'unblevable/quick-scope'
    use 'zirrostig/vim-schlepp'
    use 'scrooloose/nerdcommenter'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
end)
