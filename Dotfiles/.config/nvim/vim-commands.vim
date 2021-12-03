"command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Trans call LetMeSee()

function LetMeSee()
    highlight NonText guibg=NONE
    highlight Normal guibg=NONE
endfunction

