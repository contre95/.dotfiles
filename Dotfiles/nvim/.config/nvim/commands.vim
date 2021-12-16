command! -nargs=0 Fmt lua vim.lsp.buf.formatting()
command! -nargs=0 LspLog lua vim.cmd('sp'..vim.lsp.get_log_path())
command! -nargs=0 Trans call LetMeSee()


" Functions
function LetMeSee()
    highlight NonText guibg=NONE
    highlight Normal guibg=NONE
endfunction

