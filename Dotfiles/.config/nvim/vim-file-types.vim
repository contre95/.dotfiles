"---------------------------------------------------------------------------------------------
"------------------------------------ Custom settings for filetype ----------------------------
"----------------------------------------------------------------------------------------------

"Set terrform Markdown
"-------------------------------------
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType markdown setlocal textwidth=80
autocmd FileType markdown setlocal colorcolumn=-2 
let g:markdown_fenced_languages = ['julia', 'css', 'python', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'html', 'go']

"Set terrform Yaml
"-------------------------------------
autocmd BufNewFile,BufReadPre,FileReadPre *.yaml, *.yml, *.sls :setlocal expandtab tabstop=2 shiftwidth=2 

"Set terrform GitCommits
"-------------------------------------
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

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

"Set logstash filetype 
"-------------------------------------
fun! s:DetectLogstash()
    if getline(1) =~ '^[ \t]*input {'
        set syntax=logstash
        set nowrap
    endif
endfun
autocmd BufNewFile,BufRead *.conf call s:DetectLogstash()

"Set terrform filetype 
"-------------------------------------
aug terraform_ft_detection
    au!
    au BufNewFile,BufRead *.tf set filetype=terraform
aug end
