command! -nargs=0 Fmt lua vim.lsp.buf.formatting()
command! -nargs=0 LspLog lua vim.cmd('sp'..vim.lsp.get_log_path())
command! -nargs=0 Trans call LetMeSee()
command! Types :lua require('lsp_extensions').inlay_hints{ enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }


" Functions
function LetMeSee()
    highlight NonText guibg=NONE
    highlight Normal guibg=NONE
endfunction

