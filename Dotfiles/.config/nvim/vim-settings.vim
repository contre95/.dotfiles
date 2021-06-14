" Common settings
"-------------------------------------
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

set expandtab ts=4 sw=4 ai

set undodir=~/.vim/undodir
filetype plugin indent on
set guicursor=n-v-ve-i-c-ci:ver25
set pastetoggle=<F9>
set noshowmode
set background=dark
set encoding=utf-8
set relativenumber
set softtabstop=4
set tabpagemax=4 
set laststatus=2
set shiftwidth=4
set path+=**
set wildmenu
set cursorcolumn
set nocompatible
set smartindent
set splitbelow
set cursorline
set autoindent
set nospell
set smarttab
set splitright
set noswapfile
set ignorecase
set syntax=on
set spelllang=en
set showmatch	
set tabstop=4
set incsearch
set hlsearch
set mouse=a
set nowrap
set number
set bs=2
set nu

" Treat end of lines like normal IDE
"-------------------------------------
set virtualedit=all
set sel=exclusive

