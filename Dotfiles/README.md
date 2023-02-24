## Dotfiles 

In order for this Dotfiles to work both $MY_FOLDER and $SCR_PATH have to be set globally. Since I use a display manager (ligthdm) to start x and login I usually set these in `/etc/lightdm/Xsession`. If you wan these variables to also be set for all the sessions you can set them under `/etc/environment`

```bash
# For example
export MY_FOLDER="/home/contr"
export MYENV="desktop"
export SCR_PATH="$MY_FOLDER/Scripts"
```

These variables are set differently in different environments I use and most of the dotfiles functionality depends on these
