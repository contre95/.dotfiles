local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return require("packer").startup(
    function()
        use 'marko-cerovac/material.nvim'
        --use 'EdenEast/nightfox.nvim'
        --use 'folke/tokyonight.nvim'

        use "wbthomason/packer.nvim"
        use "nvim-treesitter/nvim-treesitter"
        use 'junegunn/goyo.vim'
        use {
            'nvim-lualine/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons'
            --config = function() require'nvim-tree'.setup {} end
        }
        use {
        	"luukvbaal/stabilize.nvim",
        	config = function() require("stabilize").setup() end
        }

        use {
            'lewis6991/gitsigns.nvim',
            requires = {
              'nvim-lua/plenary.nvim'
            },
            -- tag = 'release' -- To use the latest release
        }
        use "akinsho/nvim-bufferline.lua"
        use "alvan/vim-closetag"
        -- use  'rust-lang/rust.vim'
        -- use  'neovim/nvim-lspconfig' 
        
        -- -- Language Specific
        use 'fatih/vim-go'
        use 'hashivim/vim-terraform'
        -- -- Other
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'ekickx/clipboard-image.nvim'
        use 'unblevable/quick-scope'
        use 'zirrostig/vim-schlepp'
        use 'scrooloose/nerdcommenter'
        use 'junegunn/fzf'
        use {
              "folke/twilight.nvim",
              config = function()
                require("twilight").setup {
                  -- your configuration comes here
                  -- or leave it empty to use the default settings
                  -- refer to the configuration section below
                }
            end
          }
    end,
        {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
