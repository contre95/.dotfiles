# Keyboard dotfiles

It's a modified version of the original us Keymap file to have accent marks and symbols like "~" with dead keys in MacOs.
Changing the "Option" key on Mac keyboard for the "Right Alt" on regular keyboards
`Right Alt+e + [aeiouAEIOU] = áéíóúÁÉÍÓÚ`
`Right Alt+n + [n] = ñ`
`Right Alt+u + [u] = ü`

If setting up the keyboard layout under .config doesn't work:
```
cp ./us /usr/share/X11/xkb/symbols/us
setxkbmap -layout us -variant mac
```
