## Dotfiles 

In order for this Dotfiles to work both $MY_FOLDER and $SCR_PATH have to be set globally. Since I use a display manager (ligthdm) to start x and login I usually set these in `/etc/lightdm/Xsession`

```bash
# For example
export MY_FOLDER="/home/canus"
export SCR_PATH="$MY_FOLDER/Scripts"
```

These variables are set differently in different environments I use and most of the dotfiles functionality depends on these
