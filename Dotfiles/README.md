## Dotfiles 

In order for this Dotfiles to work both `$MY_FOLDER` and `$SCR_PATH` have to be set globally under `/etc/environment`.

```bash
# For example
MY_FOLDER="/home/contr"
MYENV="desktop" # desktop | notebook | server 
SCR_PATH="/home/contr/Scripts"
```

These variables are set differently in different environments I use and most of the dotfiles functionality depends on these

## Additional variables you can set up

```shell
MOZ_USE_XINPUT2=1 # For librewolf touchscreen support. See https://github.com/contre95/.dotfiles/blob/master/Scripts/dmenu-scr/web-light.sh#L8  
```

## Installation

Once the global env variables are set you just need to run the `./install.sh` script. Depending on `$MYENV` it will install a certain list of dotfiles.
This is specified in different [arrays](https://github.com/contre95/.dotfiles/blob/master/Dotfiles/install.sh#L24-L39) inside the installation script.

The installation simply generate a symbolic link using [stow](https://www.gnu.org/software/stow/) using the `~/.config` directory, specified in the `.stowrc`.
