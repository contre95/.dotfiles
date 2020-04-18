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

"The following key binding lets you move lines Up and Down with Shift+arrow
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>
noremap <C-Up> <Esc>:m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>

"Plugins configuration
"Goyo
nnoremap <Leader>g :Goyo<CR>

"NerdCommenter
nmap <C-_> <Plug>NERDCommenterToggle <Down>
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"NERDTree
nnoremap <leader>f :NERDTreeToggle<Enter>
let NERDTreeMapOpenInTab='<ENTER>'

"the following key lets you copy a line with ctrl+d like in commond ides
"vmap  <C-Down> <Plug>SchleppIndentDown
"vmap  <C-Up> <Plug>SchleppIndentUp
vmap <C-Up> <Plug>SchleppIndentUp
vmap <C-Down> <Plug>SchleppIndentDown
let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1
let g:Schlepp#trimWS = 0
"vmap <unique> i <Plug>SchleppToggleReindent
nmap <C-d> mzyyp`z

"shift+arrow selection
nmap <S-Down> V<Down>
nmap <S-Left> v<Left>
imap <S-Up> <Esc>V<Up>
nmap <S-Right> v<Right>
nmap <S-Up> v<Up>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Left> <Esc>V<Left>
imap <S-Down> <Esc>V<Down>
imap <S-Right> <Esc>V<Right>


"vmap <silent> <S-End> <End>
"vmap <silent> <S-Home> <Home>
nnoremap <C-S-Left> <Esc>v
nnoremap <C-S-Down> <Esc>v
nnoremap <C-S-Right> <Esc>v
nnoremap <C-S-Up> <Esc>v

"Move throug tabs with Crtl+/Right arrows
nmap <A-S-Left> gT
nmap <A-S-Right> gt
:map <C-t> :tabnew <Enter>
:map <C-w> :close <Enter> :NERDTreeClose <Enter>

" Select all the text with Crtl+a
:map <C-a> GVgg
" Undo with Crtl+z
:map <C-z> u
"Find with Ctrl+f
:map <C-f> /
"Find and Replace with Ctrl+r
:map <C-r> :%s/

"Vim custom settings
set tabpagemax=15 
set smartindent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab ts=4 sw=4 ai
set splitbelow
set encoding=utf-8
set virtualedit=onemore
set sel=exclusive
set splitright
set mouse=a
set nu
"The following key binding lets you move between buffers with Crtl+Atl+Arrows
nnoremap <silent> <C-A-Right> <C-w>l
nnoremap <silent> <C-A-Left> <C-w>h
nnoremap <silent> <C-A-Up> <C-w>k
nnoremap <silent> <C-A-Down> <C-w>j

" Lets you move to the end of the line (virtualedit=onemore needed)
noremap $ $<Right>
nnoremap <End> <End><Right>



" Vim Pluuged Plugins
" To install Plugged on Unix-based systems please run the following command:
" curl -fLo ~/.vim/autoload/Plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
	 Plug 'scrooloose/nerdcommenter'
     Plug 'scrooloose/nerdtree'
     Plug 'Valloric/YouCompleteMe'
     Plug 'zirrostig/vim-schlepp'
     Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
     Plug 'watzon/vim-edge-template'
    "Plug 'junegunn/goyo.vim'
    "Plug 'mattn/emmet-vim'
	"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	"Plug 'junegunn/fzf.vim'
     Plug 'itchyny/lightline.vim'
	"Plug 'ryanoasis/vim-devicons'
    "Plug 'honza/vim-snippets'
    "Plug 'sirVer/ultisnips'
call plug#end()

autocmd BufWinEnter * NERDTreeMirror
"Vim5 and later versions sUpport syntax highlighting. Uncommenting the next
"line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Set i3config filetype 
aug i3config_ft_detection
  au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3
aug end

aug roficss_ft_detection
  au!
    au BufNewFile,BufRead *.rasi set filetype=css
aug end


" Copy to 'clipboard registry' (not sure this is working...)
"vmap <C-c> "+y
"map <C-v> "+p

" Select all text
nmap <C-a> ggVG

"Uncomment the following to have Vim load indentation rules and Plugins
"according to the detected filetype.
"if has("autocmd")
" filetype Plugin indent on
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
"colorscheme sitruuna
colorscheme PaperColor
"colorscheme sonokai
"colorscheme xcodedark

hi Normal guibg=NONE ctermbg=NONE
