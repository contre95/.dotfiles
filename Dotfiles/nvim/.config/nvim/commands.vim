" Lsp
command! -nargs=0 Def lua vim.lsp.buf.definition()
command! -nargs=0 Fmt lua vim.lsp.buf.formatting()
command! -nargs=0 Imp lua vim.lsp.buf.implementation()
command! -nargs=0 Ref lua vim.lsp.buf.references()
command! -nargs=0 Info lua vim.lsp.buf.hover()
command! -nargs=0 Diagnose lua vim.lsp.diagnostic.show_line_diagnostics()
command! -nargs=0 CodeAction lua vim.lsp.buf.code_action()
command! -nargs=0 Rename lua vim.lsp.buf.rename()
command! -nargs=0 SignatureHelp lua vim.lsp.buf.signature_help()
command! -nargs=0 LspLog lua vim.cmd('sp'..vim.lsp.get_log_path())
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{ prefix = '>', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Misc
command! -nargs=0 Trans call LetMeSee()
function LetMeSee()
    highlight NonText guibg=NONE
    highlight Normal guibg=NONE
endfunction

" I sincerely don't remember what this is for
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"


