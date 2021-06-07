local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return require("packer").startup(
    function()
        use "wbthomason/packer.nvim"
        use "siduck76/nvim-base16.lua"
        use "nvim-treesitter/nvim-treesitter"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "ryanoasis/vim-devicons"
        --use {"nvim-telescope/telescope.nvim", requires={"nvim-lua/plenary.nvim","nvim-lua/popup.nvim" }}
        --use "nvim-telescope/telescope-media-files.nvim"
        use "alvan/vim-closetag"

        --use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim' }}
        --use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}


	-- Old
    -- -- Language Specific
    use 'fatih/vim-go'
    use 'hashivim/vim-terraform'

    -- -- Other
	use 'neoclide/coc.nvim'--, {'branch': 'release'}
    use 'ekickx/clipboard-image.nvim'
    use 'unblevable/quick-scope'
    use 'zirrostig/vim-schlepp'
	use 'scrooloose/nerdcommenter'
    --use 'itchyny/vim-gitbranch'
	--use 'jiangmiao/auto-pairs'
	--use 'shime/vim-livedown'
    use 'junegunn/fzf'

    end,
        {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
