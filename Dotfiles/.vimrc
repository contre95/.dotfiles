"                              ___           ___           ___
"     ___        ___          /__/\         /  /\         /  /\
"    /__/\      /  /\        |  |::\       /  /::\       /  /:/
"    \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/
"     \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___
" ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"/__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"\  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/
" \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/
"  \__\::::/      \__\/      \  \:\        \  \:\        \  \::/
"      ~~~~                   \__\/         \__\/         \__\/



" Tmux configuration, tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Setting the leader key 
let mapleader = " "

"The following key binding lets you move lines up and down with Shift+arrow
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>
noremap <C-Up> <Esc>:m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>

nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>g :Goyo<CR>
"The following key lets you copy a line with CTRL+d preserving the cursos
"positon
nmap <C-d> mzyyp`z

" shift+arrow selection
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
nmap <S-Up> v<Up>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
"imap <S-Right> <Esc>v<Right>

"" Regular editor Vim Mapping
"nmap <A-Left> gT
"nmap <A-Right> gt
set tabpagemax=15 
set smartindent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab ts=4 sw=4 ai
set encoding=UTF-8
set splitbelow
set splitright
set mouse=a
set nu
:map <C-a> GVgg
:map <C-n> :enew
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
:map <C-t> :tabnew <Enter>
:map <C-o> :tabnew . <Enter>
:map <C-z> u
":map <C-w> :close <Enter>
:map <C-f> /
:map <C-r> :%s/
nnoremap <silent> <C-A-Right> <c-w>l
nnoremap <silent> <C-A-Left> <c-w>h
nnoremap <silent> <C-A-Up> <c-w>k
nnoremap <silent> <C-A-Down> <c-w>j


" Vim Pluuged Plugins
" To install Plugged on Unix-based systems please run the following command:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


call plug#begin('~/.vim/plugged')
    Plug 'mattn/emmet-vim'
    Plug 'scrooloose/nerdtree'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'scrooloose/nerdcommenter'
	Plug 'junegunn/fzf.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'ryanoasis/vim-devicons'
    Plug 'honza/vim-snippets'
    Plug 'sirVer/ultisnips'
call plug#end()

"  Nerd tree open in new tab
let NERDTreeMapOpenInTab='t'

"Vim5 and later versions support syntax highlighting. Uncommenting the next
"line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Set i3config filetype 
aug i3config_ft_detection
  au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3
aug end

" Copy to 'clipboard registry' (not sure this is working...)
 "vmap <C-c> "+y
 "map <C-v> "+p

" Select all text
nmap <C-a> ggVG

"Uncomment the following to have Vim load indentation rules and plugins
"according to the detected filetype.
"if has("autocmd")
" filetype plugin indent on
"endif

"The following are commented out as they cause vim to behave a lot
"differently from regular Vi. They are highly recommended though.
"set showcmd		"Show (partial) command in status line.
"set incsearch		"Incremental search
"set autowrite		"Automatically save before commands like :next and :make
"set hidden		"Hide buffers when they are abandoned

"Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"My config
set showmatch		"Show matching brackets.
set incsearch
set number
set relativenumber
set ignorecase		"Do case insensitive matching
"set smartcase		"Do smart case matching
set bs=2
set hlsearch
set wildmenu
set autoindent
set softtabstop=2
set shiftwidth=4
set laststatus=2
set mouse=a	"Enable mouse usage (all modes)
set t_Co=256                            " 256 colors
set background=dark
colorscheme PaperColor
hi Normal guibg=NONE ctermbg=NONE


