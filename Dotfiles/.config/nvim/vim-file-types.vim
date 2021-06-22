"---------------------------------------------------------------------------------------------
"------------------------------------ Custom settings for filetype ----------------------------
"----------------------------------------------------------------------------------------------

"Set Julia filetype 
"-------------------------------------
aug julia_ft_detection
  au!
  au BufRead,BufNewFile *.jl :set filetype=julia
aug end

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

autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType markdown setlocal textwidth=80
let g:markdown_fenced_languages = ['julia', 'css', 'python', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'html', 'go']

autocmd BufNewFile,BufReadPre,FileReadPre *.yaml,*.yml :setlocal expandtab tabstop=2 shiftwidth=2

autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell
