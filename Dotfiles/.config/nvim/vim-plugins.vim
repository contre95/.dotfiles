"----------------------------------------------------------------------------------------------
"------------------------------------ Plugins configuration -----------------------------------
"----------------------------------------------------------------------------------------------

" Goyo or similar
nmap <silent> <leader>g :Goyo<CR>

" Coc
"-------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let b:coc_pairs_disabled = ['<']
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" Buffline
"-------------------------------------
autocmd BufEnter * call DeleteHiddenBuffers() " Deletes all hidden buffer so they are not displayed by bufferline

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction


" CloseTag
"-------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" Indent Blank Line
"-------------------------------------
let g:indentLine_char = '│'
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_filetype = ['vim', 'python', 'sh']

"Sneak 
"-------------------------------------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

 "Python-syntax
"let g:python_highlight_all = 1

" Vim-Go
"-------------------------------------
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1


"NerdCommenter
"-------------------------------------
nmap <C-_> <Plug>NERDCommenterToggle <Down>
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"Marckdown-img-paste
"-------------------------------------
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

"Schleep indention
"-------------------------------------
vmap <C-Down> <Plug>SchleppIndentDown
vmap <C-Up> <Plug>SchleppIndentUp
vmap <C-d> <Plug>SchleppDup
let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1
let g:Schlepp#trimWS = 0

 " Telescope
"-------------------------------------
"nnoremap <silent> <Leader>o :Telescope find_files <CR>

" Fuzzy Finder (fzf)
"-------------------------------------
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
:map <silent><C-t> :bw :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 },'down': '40%','sink': 'tabedit', 'options': ['--info=inline', '--preview', '~/.config/nvim/fzf/fzf-preview.sh {}']})<CR> 
nnoremap <silent> <Leader>t :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 },'down': '40%','sink': 'tabedit', 'options': ['--info=inline', '--preview', '~/.config/nvim/fzf/fzf-preview.sh {}']})<CR>
nnoremap <silent> <Leader>s :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 }, 'down': '40%','sink': 'vertical botright split', 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/fzf/fzf-preview.sh {}']})<CR>
nnoremap <silent> <Leader>v :call fzf#run({'window': { 'width': 0.9, 'height':0.6 }, 'down': '40%','sink': 'split', 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/fzf/fzf-preview.sh {}']})<CR>
nnoremap <silent> <Leader>o :call fzf#run({'window': { 'width': 0.9, 'height': 0.6 },'down': '40%','sink': 'e', 'options': ['--info=inline', '--preview', '~/.config/nvim/fzf/fzf-preview.sh {}']})<CR>
nnoremap <silent> <Leader>c :call fzf#run({'source': map(split(globpath(&rtp, "colors/*.vim"), "\n"),"substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),'sink': 'colo','options': '+m','right':    30})<CR>

" Livedown 
"let g:livedown_autorun = 1
" Open with brave
nnoremap <silent> <Leader>m :call jobstart(printf('livedown start %s --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242"',@%),{'detach':1})<CR>
" Open with Zathura
nnoremap <silent> <Leader>m :call jobstart(printf('livedown start %s --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242"',@%),{'detach':1})<CR>
"let g:livedown_open = 1

" NvimTree
"-------------------------------------
nnoremap <leader>f :NvimTreeToggle<Enter>

" BarBar 
"-------------------------------------
" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:false
let bufferline.closable = v:true
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.maximum_padding = 1
let bufferline.maximum_length = 15
let bufferline.semantic_letters = v:false
let bufferline.no_name_title = " New File"

