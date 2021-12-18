command! -nargs=0 Trans call LetMeSee()
command! -nargs=0 Fmt lua vim.lsp.buf.formatting()
command! -nargs=0 Info lua vim.lsp.buf.hover()
command! -nargs=0 Rename lua vim.lsp.buf.rename()
command! -nargs=0 LspAction lua vim.lsp.buf.code_action()
command! -nargs=0 LspLog lua vim.cmd('sp'..vim.lsp.get_log_path())
command! -nargs=0 LspHelp lua vim.lsp.buf.signature_help()


" Functions
function LetMeSee()
    highlight NonText guibg=NONE
    highlight Normal guibg=NONE
endfunction

