cp ~/.config/i3/config $MY_FOLDER/Dotfiles/.config/i3/config
cp ~/.config/i3/compton.conf $MY_FOLDER/Dotfiles/.config/i3/compton.conf

cp ~/.config/i3blocks/config $MY_FOLDER/Dotfiles/.config/i3blocks/config
cp ~/.config/i3blocks/config_mon_1 $MY_FOLDER/Dotfiles/.config/i3blocks/config_mon_1
cp ~/.config/i3blocks/config_mon_2 $MY_FOLDER/Dotfiles/.config/i3blocks/config_mon_2

# Termite
cp ~/.config/termite/config $MY_FOLDER/Dotfiles/.config/termite/config

# Zathura
cp ~/.config/zathura/zathurarc $MY_FOLDER/Dotfiles/.config/zathura/zathurarc

# Tmux
cp ~/.tmux.conf $MY_FOLDER/Dotfiles/.tmux.conf

# GTK3
cp -r ~/.config/gtk-3.0 $MY_FOLDER/Dotfiles/.config

# Ranger
cp -r ~/.config/ranger $MY_FOLDER/Dotfiles/.config

# Vim 
cp -r ~/.config/nvim $MY_FOLDER/Dotfiles/.config
#cp -r ~/.vim/colors $MY_FOLDER/Dotfiles/.vim
#cp -r ~/.vim/syntax $MY_FOLDER/Dotfiles/.vim
#cp -r ~/.vim/spell $MY_FOLDER/Dotfiles/.vim
#cp -r ~/.config/gtk-3.0/gtk.css $MY_FOLDER/Dotfiles/.config/gtk-3.0/gtk.css
#cp ~/.vimrc $MY_FOLDER/Dotfiles/.vimrc

# Zsh
cp ~/.zshrc $MY_FOLDER/Dotfiles/.zshrc
cp -r ~/.zsh $MY_FOLDER/Dotfiles

# Newsboat
cp -r ~/.newsboat/config $MY_FOLDER/Dotfiles/.newsboat/config

# BSPWM
cp -r ~/.config/bspwm $MY_FOLDER/Dotfiles/.config
# Lemonbar
cp -r ~/.config/lemonbar $MY_FOLDER/Dotfiles/.config
# SXHKD
cp -r ~/.config/sxhkd $MY_FOLDER/Dotfiles/.config

# Dunst
cp -r ~/.config/dunst $MY_FOLDER/Dotfiles/.config

notify-send " Dotfiles Synched" "Please push changes "
