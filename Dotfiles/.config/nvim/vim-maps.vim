"Shift selection
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

" Move lines with Ctrl+arrow
inoremap <C-Down> <Esc>:m+<CR>
noremap <C-Up> <Esc>:m-2<CR>
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>

" Scroll like normal ide with Shift + Arrows
map <S-A-Down> <C-E><C-E>
map <S-A-Up> <C-Y><C-Y>

"Copy current line with Ctrl+d
nmap <C-d> mzyyp`z

"Copy current line to clipboard
vmap <C-C> "+y
vmap <C-X> "+x


" Move through words wit Crtl
nnoremap <C-Right> e<Right>
nnoremap <C-Left> b

"Switch tabs with Crtl+Shift+arrows
nmap <C-A-S-Right> gt
nmap <C-A-S-Left> gT
"
"Switch Buffers with Crtl+Shift+arrows
nmap <C-A-S-Up> :bn<Enter>
nmap <C-A-S-Down> :bp<Enter>

" Delete the word in front of the cursor
imap <C-D> X<Esc>lbce

" Undo with Crtl+z / Redo with Crtl+Shif+z
:map <C-C-z> :redo
:map <C-z> u

"Find with Ctrl+f
:map <C-f> /

"Find and Replace with Ctrl+r
:map <C-r> :%s/

"Switch buffers with Crtl+Atl+arrows
nnoremap <silent> <C-A-Right> <C-w>l
nnoremap <silent> <C-A-Left> <C-w>h 
nnoremap <silent> <C-A-Down> <C-w>j
nnoremap <silent> <C-A-Up> <C-w>k

" Lets you move to the end of the line (virtualedit=onemore needed)
nnoremap <End> <End><Right>
noremap $ $<Right>

" Formatting
nnoremap <leader><leader> migggqG`izz

