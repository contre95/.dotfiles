" Common settings
"-------------------------------------
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

filetype plugin indent on
set guicursor=n-v-ve-i-c-ci:ver25
set expandtab ts=4 sw=4 ai
set undodir=~/.vim/undodir
set pastetoggle=<F9>
set fillchars=eob:\ , " Removes the ~ for non writtens lineas 
set background=dark
set encoding=utf-8
set relativenumber
set softtabstop=4
set tabpagemax=4 
set wrapmargin=2
set laststatus=2
set shiftwidth=4
set spelllang=en
set cursorcolumn
set smartindent
set splitright
set splitbelow
set cursorline
set autoindent
set noswapfile
set noshowmode
set ignorecase
set syntax=on
set showmatch	
set tabstop=4
set incsearch
set smarttab
set hlsearch
set wildmenu
set path+=**
set mouse=a
set nospell
set number
set bs=2
set nu

" Treat end of lines like normal IDE
"-------------------------------------
set virtualedit=all
set sel=exclusive

