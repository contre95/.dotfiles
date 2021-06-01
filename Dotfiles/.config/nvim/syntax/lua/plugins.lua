-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'junegunn/fzf'--, { 'dir': '~/.fzf', 'do': './install --all', 'do': 'yarn install', 'for': ['python'] }
  use 'fatih/vim-go'--, { 'do': ':GoUpdateBinaries' }
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'vim-python/python-syntax'
  use 'scrooloose/nerdcommenter'
  use 'ryanoasis/vim-devicons'
  use 'hashivim/vim-terraform'
  use 'unblevable/quick-scope'
  use 'zirrostig/vim-schlepp'
  use 'itchyny/lightline.vim'
  use 'itchyny/vim-gitbranch'
  use 'jiangmiao/auto-pairs'
  use 'ferrine/md-img-paste.vim'
  use 'scrooloose/nerdtree'
  use 'shime/vim-livedown'
  use 'neoclide/coc.nvim'--, {'branch': 'release'}
  use 'junegunn/fzf.vim'
  use 'mattn/emmet-vim'

end)
