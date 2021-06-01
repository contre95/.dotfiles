"---------------------------------------------------------------------------------------------
"------------------------------------ Custom settings for filetype ----------------------------
"----------------------------------------------------------------------------------------------

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

