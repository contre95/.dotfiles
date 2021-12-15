syntax enable
hi LineNr guibg=bg
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=gray
hi StatusLineNC gui=underline guibg=NONE guifg=#2d2d2d
hi NvimTreeFolderName gui=NONE guifg=grey
hi NvimTreeOpenedFolderName gui=NONE guifg=#80ABAB
hi NvimTreeRootFolder gui=NONE guifg=#80ABAB
hi NvimTreeExecFile gui=NONE guifg=#6CF7A2


" Background colors for active vs inactive windows
hi ActiveWindow guibg=#1c1c1c
"hi InactiveWindow guibg=bg

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

"let fg_target = 'red'

"let fg_current  = s:fg(['Normal'], '#efefef')
"let fg_visible  = s:fg(['TabLineSel'], '#efefef')
"let fg_inactive = s:fg(['TabLineFill'], '#888888')

"let fg_modified  = s:fg(['WarningMsg'], '#E5AB0E')
"let fg_special  = s:fg(['Special'], '#599eff')
"let fg_subtle  = s:fg(['NonText', 'Comment'], '#555555')

"let bg_current  = s:bg(['Normal'], '#000000')
"let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#000000')
"let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000')

