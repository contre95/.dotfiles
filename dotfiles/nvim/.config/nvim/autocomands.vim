"---------------------------------------------------------------------------------------------
"------------------------------------ Custom Autocommands ----------------------------
"----------------------------------------------------------------------------------------------

" This is for vim buffer to not ocupy the total amount of the window
"autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" Open help always vertical
"-------------------------------------
autocmd FileType help wincmd L

" Set Rust 
"-------------------------------------
"autocmd BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

"Set Go
autocmd BufWritePost *.go lua vim.lsp.buf.format({async = true})
lua <<EOF
  -- …

  function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
EOF

autocmd BufWritePre *.go lua go_org_imports()

"Set Caddyfile
"-------------------------------------
au BufNewFile,BufRead Caddyfile,*.Caddyfile,Caddyfile.* set ft=caddyfile

"Set Logstash
"-------------------------------------
autocmd FileType logstash setlocal commentstring=#\ %s 

"Set Hyprland.conf
"-------------------------------------
autocmd FileType hypr setlocal commentstring=#\ %s 

"Set Markdown
"-------------------------------------
autocmd FileType markdown setlocal spell 
"autocmd FileType markdown setlocal complete+=kspell
autocmd FileType markdown setlocal wrap 
autocmd FileType markdown setlocal nonumber
autocmd FileType markdown setlocal norelativenumber
" autocmd FileType markdown setlocal textwidth=80
" autocmd FileType markdown setlocal colorcolumn=-2 

"Set Yaml
"-------------------------------------
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 

"Set GraphQL
"-------------------------------------
autocmd BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql

"Set GitCommits
"-------------------------------------
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell


"Set JSON FileType
"-------------------------------------
"aug json_ft_detection
  "au!
  "au BufRead,BufNewFile *.json set filetype=json syntax=json
"aug end

"Set Dockerfile filetype
"-------------------------------------
aug docker_ft_detection
  au!
  au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile
aug end

"Set Salt
"-------------------------------------
aug salt_ft_detection
  au!
  au BufRead,BufNewFile *.sls set filetype=yaml
aug end

"Set Julia filetype 
"-------------------------------------
aug julia_ft_detection
  au!
  au BufRead,BufNewFile *.jl set filetype=julia
aug end

"Set Hyprland
"-------------------------------------
augroup hypr_ftdetect
  au!
  au BufRead,BufNewFile *hypr/*.conf,*hypr/*/*.conf set ft=hypr
augroup END

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

"Set Logstash filetype 
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
    au BufNewFile,BufRead *.tfvars set filetype=config
    au BufNewFile,BufRead *.tf set filetype=terraform
    au BufWritePre *.tf lua vim.lsp.buf.format({async = true})
aug end

"Set SXHKD filetype
"-------------------------------------
aug sxhkd_ft_detection
    au!
    autocmd BufNewFile,BufRead sxhkdrc,*.sxhkdrc set ft=sxhkdrc
    "set syntax=sxhkdrc
aug end
