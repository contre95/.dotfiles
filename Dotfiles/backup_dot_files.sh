#!/usr/bin/zsh

improved_cp () {
  if [ ! -d "$2" ]; then
      mkdir -p "$2"
  fi
  cp "$1" "$2"
}



# These guys over here are ok with cp
cp ~/.vimrc .vimrc
cp ~/.zshrc .zshrc

# These ungratefull bastards require directories to be copied
#improved_cp "$HOME/.config/termite/config" ".config/termite/config"
improved_cp "$HOME/.config/i3/config" "./.config/i3"
improved_cp "$HOME/.config/i3/compton.conf" "./.config/i3"
#improved_cp "$HOME/.config/i3status/config" ".config/i3status"
#improved_cp "$HOME/.config/rofi-themes/material.rasi" ".config/rofi-themes/"
#improved_cp "$HOME/.config/rofi-themes/onedark.rasi" ".config/rofi-themes/" 
#improved_cp "$HOME/.config/rofi-themes/rofi-themes-repo.txt" ".config/rofi-themes/"
improved_cp "$HOME/.vim/colors/PaperColor.vim" ".vim/colors"
improved_cp "$HOME/.vim/syntax/terraform.vim" ".vim/syntax"
improved_cp "$HOME/.vim/syntax/i3.vim" ".vim/syntax"
improved_cp "$HOME/.vim/syntax/twig.vim" ".vim/syntax"
improved_cp "$HOME/.vim/syntax/jinja.vim" ".vim/syntax"
improved_cp "$HOME/.zsh/.theme" ".zsh/.theme"

