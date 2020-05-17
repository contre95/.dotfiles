
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

"----------------------------------------------------------------------------------------------
"------------------------------------ Custom key bindings -------------------------------------
"----------------------------------------------------------------------------------------------
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"Move lines with Ctrl+arrow
"-------------------------------------
inoremap <C-Down> <Esc>:m+<CR>
noremap <C-Up> <Esc>:m-2<CR>
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>


"Copy current line with Ctrl+d
"-------------------------------------
nmap <C-d> mzyyp`z

"Shift selection
"-------------------------------------
imap <S-Right> <Esc>V<Right>
imap <S-Left> <Esc>V<Left>
imap <S-Down> <Esc>V<Down>
nmap <S-Right> v<Right>
vmap <S-Right> <Right>
nmap <S-Down> V<Down>
nmap <S-Left> v<Left>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
nmap <S-Up> V<Up>
vmap <S-Up> <Up>
nnoremap <C-S-Right> <Esc>v
nnoremap <C-S-Left> <Esc>v
nnoremap <C-S-Down> <Esc>v
nnoremap <C-S-Up> <Esc>v

"Switch tabs with Crtl+Shift+arrows
"-------------------------------------
:map <C-w> :close <Enter> :NERDTreeClose <Enter>
nmap <A-S-Right> gt
nmap <A-S-Left> gT

" Select all the text with Crtl+a
"-------------------------------------
:map <C-a> GVgg
"nmap <C-a> ggVG



" Map Ctrl-Backspace to delete the previous word in insert mode.
"-------------------------------------
imap <C-BS> <C-W>

" Undo with Crtl+z
"-------------------------------------
:map <C-z> u

"Find with Ctrl+f
"-------------------------------------
:map <C-f> /

"Find and Replace with Ctrl+r
"-------------------------------------
:map <C-r> :%s/

"Switch buffers with Crtl+Atl+arrows
"-------------------------------------
nnoremap <silent> <C-A-Right> <C-w>l
nnoremap <silent> <C-A-Left> <C-w>h
nnoremap <silent> <C-A-Down> <C-w>j
nnoremap <silent> <C-A-Up> <C-w>k

" Copy to 'clipboard registry' (not sure this is working...)
"map <C-v> "+p
"vmap <C-c> "+y

"Lets you move to the end of the line (virtualedit=onemore needed)
nnoremap <End> <End><Right>
noremap $ $<Right>

"----------------------------------------------------------------------------------------------
"------------------------------------ Vim custom settings -------------------------------------
"----------------------------------------------------------------------------------------------

"Leader key
"-------------------------------------
let mapleader = " "                                                                     

" Color Scheme
"-------------------------------------
"set termguicolors 
let &t_7f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_7b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set t_Co=256
"colorscheme monokai-phoenix
colorscheme jellybeans
"Treat end of lines like normal IDE
"-------------------------------------
set virtualedit=onemore
set sel=exclusive

"Common settings
"-------------------------------------
hi Normal guibg=NONE ctermbg=NONE
set expandtab ts=4 sw=4 ai
filetype plugin indent on
set background=dark
set encoding=utf-8
set relativenumber
set tabpagemax=15 
set softtabstop=2
set laststatus=2
set shiftwidth=4
set smartindent
set splitbelow
set splitright
set autoindent
set noswapfile
set nowrap
set ignorecase
set showmatch	
set hlsearch
"set incsearch
set wildmenu
set tabstop=4
set t_Co=256
set mouse=a
set number
set bs=2
set nu

"----------------------------------------------------------------------------------------------
"------------------------------------ Plug plugins --------------------------------------------
"----------------------------------------------------------------------------------------------

" To install Plugged on Unix-based systems please run the following command: curl -fLo ~/.vim/autoload/Plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'terryma/vim-multiple-cursors'
  Plug 'watzon/vim-edge-template'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Valloric/YouCompleteMe'
  Plug 'itchyny/vim-gitbranch'
  Plug 'zirrostig/vim-schlepp'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  "Plug 'yuki-ycino/fzf-preview.vim'
  "Plug 'ryanoasis/vim-devicons'
  "Plug 'airblade/vim-gitgutter'
  "Plug 'honza/vim-snippets'
  "Plug 'ajmwagar/vim-deus'
  "Plug 'junegunn/goyo.vim'
  "Plug 'sirVer/ultisnips'
call plug#end()

"----------------------------------------------------------------------------------------------
"------------------------------------ Plugins configuration -----------------------------------
"----------------------------------------------------------------------------------------------

"YouCompleteMe
"-------------------------------------
nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>

"NerdCommenter
"-------------------------------------
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_expandabbr_key='<Tab>'

"Multiline Cursor 
"-------------------------------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = 'g<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = '<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"NerdCommenter
"-------------------------------------
nmap <C-_> <Plug>NERDCommenterToggle <Down>
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
autocmd BufWinEnter * NERDTreeMirror

"Schleep indention
"-------------------------------------
vmap <C-Down> <Plug>SchleppIndentDown
vmap <C-Up> <Plug>SchleppIndentUp
vmap <C-d> <Plug>SchleppDup
let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1
let g:Schlepp#trimWS = 0

" Fuzzy Finder (fzf)
"-------------------------------------
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <silent> <Leader>s :call fzf#run({'down': '40%','sink': 'vertical botright split', 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
":map <C-t> :call fzf#run({'down': '40%','sink': 'tabedit', 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
:map <C-t> :call fzf#run({'down': '40%','sink': 'tabedit', 'options': ['--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
nnoremap <silent> <Leader>c :call fzf#run({'source': map(split(globpath(&rtp, "colors/*.vim"), "\n"),"substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),'sink': 'colo','options': '+m','right':    30})<CR>

"NERDTree
"-------------------------------------
nnoremap <leader>f :NERDTreeToggle<Enter>
let NERDTreeMapOpenInTab='<ENTER>'

"Lightline
"-------------------------------------
let g:lightline = {'colorscheme': 'powerline','active': {'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]},'component_function': {'gitbranch': 'gitbranch#name'},}

"Prettier
"-------------------------------------
nmap <C-l> <Plug>(Prettier)

"----------------------------------------------------------------------------------------------
"------------------------------------ Custom settings for filetype ----------------------------
"----------------------------------------------------------------------------------------------

"Set i3config filetype 
"-------------------------------------
aug i3config_ft_detection
  au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3
aug end

"Set Rofi style filetype 
"-------------------------------------
aug roficss_ft_detection
  au!
    au BufNewFile,BufRead *.rasi set filetype=css
aug end

"Set terrform filetype 
"-------------------------------------
aug terraform_ft_detection
    au!
    au BufNewFile,BufRead *.tf set filetype=terraform
aug end

"----------------------------------------------------------------------------------------------
"------------------------------------ Custom settings for filetype ----------------------------
"----------------------------------------------------------------------------------------------

" Tmux configuration, tmux will send xterm-style keys when its xterm-keys option is on
"-------------------------------------
if &term =~ '^tmux'                                                                   
    execute "set <xRight>=\e[1;*C"                                                      
    execute "set <xDown>=\e[1;*B"                                                       
    execute "set <xLeft>=\e[1;*D"                                                       
    execute "set <xUp>=\e[1;*A"                                                         
endif                                                                                   


