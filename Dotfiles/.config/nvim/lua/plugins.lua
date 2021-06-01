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
        use "alvan/vim-closetag"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "ryanoasis/vim-devicons"
        use "karb94/neoscroll.nvim"
        use {"nvim-telescope/telescope.nvim", requires={"nvim-lua/plenary.nvim","nvim-lua/popup.nvim" }}
        use "nvim-telescope/telescope-media-files.nvim"

	-- Old 
	use 'junegunn/fzf'--, { 'dir': '~/.fzf', 'do': './install --all', 'do': 'yarn install', 'for': ['python'] }
	use 'fatih/vim-go'
	use 'scrooloose/nerdcommenter'
	use 'hashivim/vim-terraform'
	use 'unblevable/quick-scope'
	use 'zirrostig/vim-schlepp'
	use 'itchyny/vim-gitbranch'
	use 'jiangmiao/auto-pairs'
    use 'ekickx/clipboard-image.nvim'
	use 'shime/vim-livedown'
	use 'neoclide/coc.nvim'--, {'branch': 'release'}
	use 'junegunn/fzf.vim'
	use 'mattn/emmet-vim'

    end
)
