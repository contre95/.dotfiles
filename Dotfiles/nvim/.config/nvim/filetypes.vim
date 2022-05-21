"---------------------------------------------------------------------------------------------
"------------------------------------ Custom settings for different filetypes ----------------------------
"----------------------------------------------------------------------------------------------

" Set Rust 
"-------------------------------------
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

"Set Go
autocmd BufWritePost *.go lua vim.lsp.buf.formatting()
"Set Markdown
"-------------------------------------
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType markdown setlocal textwidth=80
autocmd FileType markdown setlocal colorcolumn=-2 

"Set Yaml
"-------------------------------------
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 

"Set GitCommits
"-------------------------------------
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

"Set Dockerfile filetype
"-------------------------------------
aug docker_ft_detection
  au!
  au BufRead,BufNewFile Dockerfile.* :set filetype=dockerfile
aug end

"Set Salt
"-------------------------------------
aug salt_ft_detection
  au!
  au BufRead,BufNewFile *.sls :set filetype=yaml
aug end

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
        set ft=logstash
    endif
endfun
autocmd BufNewFile,BufRead *.conf call s:DetectLogstash()

"Set Terraform nfiletype 
"-------------------------------------
aug terraform_ft_detection
    au!
    au BufNewFile,BufRead *.tf set filetype=terraform
    au BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
aug end

"Set SXHKD filetype
"-------------------------------------

aug sxhkd_ft_detection
    au!
    autocmd BufNewFile,BufRead sxhkdrc,*.sxhkdrc set ft=sxhkdrc
    "set syntax=sxhkdrc
aug end
