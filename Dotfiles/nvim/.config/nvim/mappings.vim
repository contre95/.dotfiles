" Select with Shift as a normal human being
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

" Move lines with Ctrl+arrow
inoremap <C-Down> <Esc>:m+<CR>
noremap <C-Up> <Esc>:m-2<CR>
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>

" Scroll Alt + Shift + Arrows
map <A-k> <C-E><C-E>
map <A-i> <C-Y><C-Y>

"Copy current line with Ctrl+d
nmap <C-d> mzyyp`z

"Copy current line to clipboard
vmap <C-X> "+x
vmap <C-C> "+y

" Move through words wit Crtl
nnoremap <C-Right> e<Right>
nnoremap <C-Left> b

"Switch tabs with Crtl+Shift+arrows
nmap <A-Tab> gt
nmap <A-C-Tab> gT
"nmap <C-A-S-Right> gt
"nmap <C-A-S-Left> gT

" run current file
nnoremap <silent> <leader>r :source %<CR>
" Open livedown with brave (npm install -g livedown)
nnoremap <silent> <leader>m :call jobstart(printf('livedown start %s --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242"',@%),{'detach':1})<CR><CR>

" Material Colorscheme
" Keeping this just in case I change my mind later
"nmap <silent> <C-n> :lua require('material.functions').toggle_style()<CR><CR>
nmap <silent> <C-n> :lua require('material.functions').toggle_style()<CR><CR>

" NerdCommenter (scrooloose/nerdcommenter)
"-------------------------------------
nmap <C-l> <Plug>NERDCommenterToggle <Down>
nmap <C-A-l> <Plug>NERDCommenterToggle <Up>
vmap <C-l> <Plug>NERDCommenterToggle<CR>gv

"Schleep indention
"-------------------------------------
vmap <C-Down> <Plug>SchleppIndentDown
vmap <C-Up> <Plug>SchleppIndentUp
vmap <C-d> <Plug>SchleppDup

" NvimTree (kyazdani42/nvim-tree.lua)
"-------------------------------------
"nnoremap <leader>f :NvimTreeToggle<Enter>
nnoremap <silent> <C-f> :lua require"nvim-tree".toggle(false, true)<Enter>

" Telescope (nvim-telescope/telescope.nvim)
nnoremap <leader>o <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" Delete the word in front of the cursor
imap <C-D> X<Esc>lbce

" Undo with Crtl+z / Redo with Crtl+Shif+z
:map <C-S-z> :redo
:map <C-z> u

"Find and Replace with Ctrl+r
:map <C-r> :%s/

" Encode/decode selected text in base64
:vnoremap <leader>64 c<c-r>=system('base64 -w 0', @")<cr><esc>
:vnoremap <leader>46 c<c-r>=system('base64 --decode', @")<cr><esc>

"Switch buffers with Crtl+Atl+arrows
nnoremap <silent> <C-A-Right> <C-w>l
nnoremap <silent> <C-A-Left> <C-w>h 
nnoremap <silent> <C-A-Down> <C-w>j
nnoremap <silent> <C-A-Up> <C-w>k

" Lets you move to the end of the line (virtualedit=onemore needed)
nnoremap <End> <End><Right>
noremap $ $<Right>

"" Fix spelling with first option  
nnoremap <leader>j 1z=

"" Toggle spelling
nnoremap <leader>s :set invspell<CR>

"" Git reset hunk
noremap gr :Gitsigns reset_hunk<CR>
noremap gp :Gitsigns preview_hunk<CR>
noremap gb :Gitsigns blame_line<CR>

"" Dap 
nmap <leader>db :DapToggleBreakpoint<CR>
nmap <leader>do <Cmd>lua require'dapui'.open()<CR>
nmap <leader>de  <Cmd>lua require'dapui'.close()<CR>
nmap <silent> <leader>dc <Cmd>lua require'dap'.continue()<CR>
nmap <silent>  <leader>dn <Cmd>lua require'dap'.step_over()<CR>
