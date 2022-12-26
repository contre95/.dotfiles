nnoremap  <silent> <leader>r :source %<CR>
nnoremap <silent> <leader>m :call jobstart(printf('livedown start %s --port 4242 --open --browser "brave --profile-directory="Contre" --app=http://localhost:4242"',@%),{'detach':1})<CR><CR>
nmap <silent> <C-n> :lua require('material.functions').toggle_style()<CR><CR>

" NvimTree (kyazdani42/nvim-tree.lua)
"nnoremap <leader>f :NvimTreeToggle<Enter>
nnoremap <silent> <C-f> :lua require"nvim-tree".toggle(false, true)<Enter>

" Encode/decode selected text in base64
:vnoremap <leader>64 c<c-r>=system('base64 -w 0', @")<cr><esc>
:vnoremap <leader>46 c<c-r>=system('base64 --decode', @")<cr><esc>

" Lets you move to the end of the line (virtualedit=onemore needed)
"nnoremap <End> <End><Right>
"noremap $ $<Right>

