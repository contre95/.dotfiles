
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
let g:file_template_default = {}
let g:file_template_default['R'] = 'skeleton'
"Move lines with Ctrl+arrow
"-------------------------------------
inoremap <C-Down> <Esc>:m+<CR>
noremap <C-Up> <Esc>:m-2<CR>
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>

 "Prevents movis cursor con Esc
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>


" Scroll like normal ide with Shift + Arrows
map <S-A-Down> <C-E><C-E>
map <S-A-Up> <C-Y><C-Y>

"Copy current line with Ctrl+d
"-------------------------------------
nmap <C-d> mzyyp`z
"Copy current line to clipboard
"-------------------------------------
vmap <C-C> "+y
vmap <C-X> "+x


"nmap <silent> <leader>m 
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


" Move through words wit Crtl
""-------------------------------------
nnoremap <C-Right> e<Right>
nnoremap <C-Left> b

"Switch tabs with Crtl+Shift+arrows
"-------------------------------------
map <C-w> :close <Enter> :NERDTreeClose <Enter>
nmap <A-S-Right> gt
nmap <A-S-Left> gT

" Select all the text with Crtl+a
"-------------------------------------
:map <C-a> GVgg
"nmap <C-a> ggVG



" Map Ctrl-Backspace to delete the previous word in insert mode.
"-------------------------------------
" (Neveer could get thisone workings)
"noremap! <C-h> <C-w>
"noremap! <C-h> <C-w>
"imap aC-BS> <C-W>
imap <C-D> X<Esc>lbce


" Undo with Crtl+z
"-------------------------------------
:map <C-C-z> :redo

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

" Go Lint
"-------------------------------------
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

" Color Scheme
"-------------------------------------
"colorscheme monokai-phoenix
set guifont=JetBrainsMono\ 30
colorscheme jellybeans
set t_Co=256
syntax on

"Treat end of lines like normal IDE
"-------------------------------------
set virtualedit=all
set sel=exclusive

"Common settings
"-------------------------------------
hi Normal guibg=NONE ctermbg=NONE
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
set cursorcolumn
set nocompatible
set smartindent
set splitbelow
set cursorline
set autoindent
"set spell
set splitright
set noswapfile
set ignorecase
set spelllang=en,es
set showmatch	
"set smarttab
set tabstop=4
set incsearch
set hlsearch
set wildmenu
set mouse=a
set nowrap
set number
set bs=2
set nu

"----------------------------------------------------------------------------------------------
"------------------------------------ Plug plugins --------------------------------------------
"----------------------------------------------------------------------------------------------

" To install Plugged on Unix-based systems please run the following command: curl -fLo ~/.vim/autoload/Plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  "Plug 'prettier/vim-prettier', { 'do': 'yarn install'}
  "Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['python'] }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  "Plug 'watzon/vim-edge-template'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'hashivim/vim-terraform'
  Plug 'unblevable/quick-scope'
  Plug 'zirrostig/vim-schlepp'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdtree'
  Plug 'shime/vim-livedown'
  "Plug 'justinmk/vim-sneak'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  "Plug 'dbmrq/vim-ditto'

  "Plug 'chuling/equinusocio-material.vim'
  "Plug 'Valloric/YouCompleteMe'
  "Plug 'terryma/vim-multiple-cursors'
  "Plug 'yuki-ycino/fzf-preview.vim'
  "Plug 'ryanoasis/vim-devicons'
  "Plug 'airblade/vim-gitgutter'
  "Plug 'honza/vim-snippets'
  "Plug 'ajmwagar/vim-deus'
  "Plug 'junegunn/goyo.vim'
  "Plug 'sirVer/ultisnips'
Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
Plug 'noahfrederick/vim-composer'     "|
Plug 'noahfrederick/vim-laravel'
Plug 'posva/vim-vue'

call plug#end()

"----------------------------------------------------------------------------------------------
"------------------------------------ Plugins configuration -----------------------------------
"----------------------------------------------------------------------------------------------

"Sneak 
"-------------------------------------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"YouCompleteMe
"-------------------------------------
"nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>

"NerdCommenter
"-------------------------------------
"let g:user_emmet_install_global = 0
autocmd FileType html,edge,css EmmetInstall


"Multiline Cursor 
"-------------------------------------
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_word_key      = 'g<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = '<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'

" vim-go
"-------------------------------------
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'structcheck', 'dupl', 'interfacer', 'goconst']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'structcheck', 'dupl', 'interfacer', 'goconst']
"let g:go_metalinter_deadline = '20s'

" Coc
"-------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport') " use `:OR` for organize import of current buffer
"autocmd BufWritePre *.go :OR

"NerdCommenter
"-------------------------------------
nmap <C-_> <Plug>NERDCommenterToggle <Down>
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
"autocmd BufWinEnter * NERDTreeMirror
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
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
:map <silent><C-t> :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 },'down': '40%','sink': 'tabedit', 'options': ['--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
nnoremap <silent> <Leader>t :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 },'down': '40%','sink': 'tabedit', 'options': ['--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
nnoremap <silent> <Leader>s :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 }, 'down': '40%','sink': 'vertical botright split', 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
nnoremap <silent> <Leader>v :call fzf#run({'window': { 'width': 0.9, 'height':0.6 }, 'down': '40%','sink': 'split', 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
nnoremap <silent> <Leader>o :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 },'down': '40%','sink': 'e', 'options': ['--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR> 
nnoremap <silent> <Leader>c :call fzf#run({'source': map(split(globpath(&rtp, "colors/*.vim"), "\n"),"substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),'sink': 'colo','options': '+m','right':    30})<CR>

"Livedown 
"let g:livedown_autorun = 1
"nnoremap <silent> <leader>m :execute 'silent !livedown start % --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242" &'<CR>
nnoremap <silent> <Leader>m :call jobstart(printf('livedown start %s --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242"',@%),{'detach':1})<CR>
"let g:livedown_open = 1

"NERDTree
"-------------------------------------
nnoremap <leader>f :NERDTreeToggle<Enter>
"let NERDTreeMapOpenInTab='<ENTER>'
"let g:NERDTreeWinSize=10
let g:NERDTreeQuitOnOpen = 1
"autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1

"Equinusocio Material
"-------------------------------------
"colorscheme equinusocio_material
"let g:equinusocio_material_bracket_improved = 1
"let g:equinusocio_material_less = 50
"let g:equinusocio_material_style = 'pure'
"let g:equinusocio_material_hide_vertsplit = 1

"Lightline
"-------------------------------------
let g:lightline = {'colorscheme': 'powerline','active': {'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]},'component_function': {'gitbranch': 'gitbranch#name'},}

"Prettier
"-------------------------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"packloadall
"nmap <C-l> <Plug>(Prettier)
"let g:prettier#quickfix_enabled = 0
"let g:prettier#autoformat = 0
"autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.g,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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
"------------------------------------ Custom settings ----------------------------
"----------------------------------------------------------------------------------------------

" Spell-check Markdown files and Git Commit Messages
"-------------------------------------
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
" Enable dictionary auto-completion in Markdown files and Git Commit Messages
"-------------------------------------
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

" Ctrl + S is a common command to terminals to stop updating, it was a way to slow the output so you could read it on terminals that didn't have a scrollback buffer.
" (If Ctrl+S freezes your terminal, type Ctrl+Q to get it going again [https://vim.fandom.com/wiki/Map_Ctrl-S_to_save_current_or_new_files])
"-------------------------------------
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Tmux configuration, tmux will send xterm-style keys when its xterm-keys option is on
"-------------------------------------
if &term =~ '^tmux'                                                                   
    execute "set <xRight>=\e[1;*C"                                                      
    execute "set <xDown>=\e[1;*B"                                                       
    execute "set <xLeft>=\e[1;*D"                                                       
    execute "set <xUp>=\e[1;*A"                                                         
endif                                                                                   

" Tmux configuration, tmux will send xterm-style keys when its xterm-keys option is on
"-------------------------------------
let g:go_highlight_types = 1
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
