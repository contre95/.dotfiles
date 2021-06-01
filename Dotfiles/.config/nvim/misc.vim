 "----------------------------------------------------------------------------------------------
"------------------------------------ Custom settings ----------------------------
"----------------------------------------------------------------------------------------------

" Spell-check Markdown files and Git Commit Messages
"-------------------------------------
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

" Ctrl + S is a common command to terminals to stop updating, it was a way to slow the output so you could read it on terminals that didn't have a scrollback buffer.
" (If Ctrl+S freezes your terminal, type Ctrl+Q to get it going again [https://vim.fandom.com/wiki/Map_Ctrl-S_to_save_current_or_new_files])
"-------------------------------------
"noremap <silent> <C-S>          :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>

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
